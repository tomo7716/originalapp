# spec/system/admin_users_spec.rb
require 'rails_helper'

RSpec.describe "管理者ログイン機能", type: :system do
  include Warden::Test::Helpers

  before do
    driven_by(:rack_test)
  end

  let!(:admin) { FactoryBot.create(:admin_user) }
  let!(:non_admin_user) { FactoryBot.create(:user) }

  after do
    Warden.test_reset!
  end

  it "管理者がログインに成功し、管理者ページに遷移する" do
    visit new_user_session_path
    fill_in 'user_email', with: admin.email
    fill_in 'user_password', with: admin.password
    click_button 'ログイン'

    expect(page).to have_current_path(admin_dashboard_path)
    expect(page).to have_content("管理者ダッシュボード")
  end

  it "管理者以外は管理者ページにアクセスできない" do
    visit new_user_session_path
    fill_in 'user_email', with: non_admin_user.email
    fill_in 'user_password', with: non_admin_user.password
    click_button 'ログイン'

    visit admin_dashboard_path

    expect(page).to have_current_path(user_path(non_admin_user), ignore_query: true)
    expect(page).to have_content("権限がありません")
  end
end
