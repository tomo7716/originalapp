require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { FactoryBot.create(:user) }

  it "トップページにログインフォームが表示される" do
    visit root_path
    expect(page).to have_field('user_email')
    expect(page).to have_field('user_password')
  end

  it "ログインに成功し、マイページに遷移する" do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'ログイン'
    expect(page).to have_current_path(user_path(user))
    expect(page).to have_content("Signed in successfully.")
  end

  it "ログインに失敗し、再びログインページに戻ってくる" do
    visit new_user_session_path
    fill_in 'user_email', with: 'wrong@example.com'
    fill_in 'user_password', with: 'wrongpassword'
    click_button 'ログイン'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content("Invalid Email or password.")
  end
end
