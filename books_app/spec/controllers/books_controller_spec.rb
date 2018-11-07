# frozen_string_literal: true

require "rails_helper"

RSpec.describe BooksController, type: :controller do
  describe "#index" do
    it "正常にレスポンスを返すこと" do
      sign_in User.create(email: "test@example.com", password: "testtesttest")
      get :index
      expect(response).to be_successful
    end
  end
end
