# frozen_string_literal: true

require "rails_helper"

RSpec.describe BooksController, type: :controller do
  before do
    sign_in User.create(email: "test@example.com", password: "testtesttest")
  end

  describe "#index" do
    it "正常にレスポンスを返すこと" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "#show" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest", author: "test", picture: nil)
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end
  end

  describe "#new" do
    it "正常にレスポンスを返すこと" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "#edit" do
    it "正常にレスポンスを返すこと" do
      book = Book.create(title: "test", memo: "testtest", author: "test", picture: nil)
      get :edit, params: { id: book.id }
      expect(response).to be_successful
    end
  end

  describe "#create" do
    it "正常にリダイレクトすること" do
      post :create, params: {
        book: { title: "hoge", memo: "hogehoge", author: "fuga", picture: nil }
      }
      expect(response).to be_redirect
    end
  end

  describe "#update" do
    it "正常にリダイレクトすること" do
      book = Book.create(title: "test", memo: "testtest", author: "test", picture: nil)
      patch :update, params: {
        id: book.id,
        book: { title: "hoge", memo: "hogehoge", author: "fuga", picture: nil }
      }
      expect(response).to be_redirect
    end
  end

  describe "#destroy" do
    it "正常にリダイレクトすること" do
      book = Book.create(title: "test", memo: "testtest", author: "test", picture: nil) 
      delete :destroy, params: { id: book.id }
      expect(response).to be_redirect
    end
  end
end
