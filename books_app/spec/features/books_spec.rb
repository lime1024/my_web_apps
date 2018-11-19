# frozen_string_literal: true

require "rails_helper"

RSpec.describe "本の登録", type: :feature do
  before do
    User.create(email: "test@example.com", password: "testtesttest")
    visit root_path
    fill_in "Eメール", with: "test@example.com"
    fill_in "パスワード", with: "testtesttest"
    click_button "ログイン"
  end

  it "本の登録に成功する" do
    visit books_path
    click_link "登録"
    fill_in "作品名", with: "たいとるだよ"
    fill_in "著者", with: "ちょしゃだよ"
    click_button "登録する"
    expect(page).to have_content "Book was successfully created."
  end

  it "本の閲覧に成功する" do
    visit books_path
    click_link "登録"
    fill_in "作品名", with: "たいとるだよ"
    fill_in "著者", with: "ちょしゃだよ"
    click_button "登録する"
    click_link "戻る"
    click_link "詳細"
    expect(page).to have_content "たいとるだよ"
  end

  it "本の更新に成功する" do
    visit books_path
    click_link "登録"
    fill_in "作品名", with: "たいとるだよ"
    fill_in "著者", with: "ちょしゃだよ"
    click_button "登録する"
    click_link "編集"
    fill_in "作品名", with: "たいとるのへんこう"
    click_button "更新する"
    expect(page).to have_content "たいとるのへんこう"
  end

  it "本の削除に成功する" do
    visit books_path
    click_link "登録"
    fill_in "作品名", with: "たいとるだよ"
    fill_in "著者", with: "ちょしゃだよ"
    click_button "登録する"
    click_link "戻る"
    click_link "削除"
    expect(page).to have_content "Book was successfully destroyed."
  end
end
