require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、プロバイダ、UID、メールアドレス、パスワードがあれば有効な状態であること" do
    user = User.new(
      name: "Test",
      provider: "Example",
      uid: "12345678",
      email: "test@example.com",
      password: "testtesttes",
    )
    expect(user).to be_valid
  end
  it "パスワードが無ければユーザが作成されないこと" do
    user = User.new(email: "foo@example.com")
    expect(user).to_not be_valid
  end
end
