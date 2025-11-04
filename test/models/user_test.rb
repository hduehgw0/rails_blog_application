require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Example User",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  # 仕様書 4.2: ユーザー名：必須入力
  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  # 仕様書 4.2: ユーザー名：50文字以内
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # 仕様書 4.2: 自己紹介：200文字以内
  test "introduction should not be too long" do
    @user.introduction = "a" * 201
    assert_not @user.valid?
  end

  # (Deviseが担当するテスト)
  # 仕様書 4.2: メールアドレス：必須入力
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  # ケース3 [モデルテスト]: 登録済みEmail
  test "email should be unique" do
    # fixture の :one (test1@example.com) と同じEmailで保存試行
    duplicate_user = @user.dup
    duplicate_user.email = users(:one).email
    @user.save # fixture のユーザーを先に保存(またはDBに存在させる)
    assert_not duplicate_user.valid?
  end

  # ケース4 [モデルテスト]: パスワード確認不一致
  test "password confirmation should match" do
    @user.password_confirmation = "mismatch"
    assert_not @user.valid?
  end

  # 仕様書 4.2: パスワード：8文字以上
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end
end
