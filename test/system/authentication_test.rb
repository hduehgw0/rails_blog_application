# require "application_system_test_case"

# class AuthenticationTest < ApplicationSystemTestCase
#     # T-07, T-08 (Userモデルと新規登録) が未実装のため、
#     # ここではテスト用のUserを fixture (test/fixtures/users.yml) または
#     # FactoryBot (推奨) で作成する前提。
#     # (ここでは fixture を使う前提で setup します)

#     def setup
#         # test/fixtures/users.yml に定義された :one を取得
#         @user = users(:one)
#     end

#     test "ケース7 (ハッピーパス): 正常にログアウトできる" do
#         # Given: ユーザーがログイン済みである
#         # (Deviseのテストヘルパー `sign_in` を使ってログイン状態をシミュレート)
#         sign_in @user
#         visit dashboard_path # ログイン後のページにアクセス

#         # ヘッダーが「ログイン後」であることを確認
#         assert_selector "a", text: "設定"
#         assert_selector "button", text: "ログアウト"

#         # When: ヘッダーのドロップダウンから「ログアウト」リンクをクリックする
#         # (BootstrapのDropdownはJS操作が必要な場合があるが、button_toなら直接クリックできる)
#         click_on "ログアウト"

#         # Then: 4.1. ランディングページ (root_path) にリダイレクトされること
#         assert_current_path root_path

#         # And: 「ログアウトしました」というFlashメッセージが表示されること
#         assert_text "ログアウトしました。"

#         # And: ヘッダーが「未ログイン時」表示に変わること
#         assert_selector "a", text: "ログイン"
#         assert_selector "a", text: "新規登録"
#         assert_no_selector "a", text: "設定"
#     end
# end
