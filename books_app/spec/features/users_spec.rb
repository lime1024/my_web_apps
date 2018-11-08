require 'rails_helper'

RSpec.describe "ログイン", type: :feature do
  before do
    User.create(email: "test@example.com", password: "testtesttest")
  end

  it "ログインする" do
    visit root_path
    fill_in 'Eメール', with: 'test@example.com'
    fill_in 'パスワード', with: 'testtesttest'
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'
  end

  it "GitHubでログインする" do
    OmniAuth.config.test_mode = true
    params = { extra: { raw_info: { provider: 'github', uid: '123545' }}}
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(params)
    visit root_path
    click_link "GitHubでログイン"
    expect(page).to have_content 'GitHub アカウントによる認証に成功しました。'
  end
end
