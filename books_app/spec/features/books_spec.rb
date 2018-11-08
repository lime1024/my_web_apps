require 'rails_helper'

RSpec.describe "本の登録", type: :feature do
  before do
    User.create(email: "test@example.com", password: "testtesttest")
    visit root_path
    fill_in 'Eメール', with: 'test@example.com'
    fill_in 'パスワード', with: 'testtesttest'
    click_button 'ログイン'
  end

  it "本の登録に成功する" do
    visit books_path
    click_link '登録'
    fill_in "作品名", with: 'たいとるだよ'
    fill_in '著者', with: 'ちょしゃだよ'
    click_button '登録する'
    expect(page).to have_content 'Book was successfully created.'
  end
end
