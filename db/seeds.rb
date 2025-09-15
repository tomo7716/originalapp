# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Item.create!(name: "商品1", points: 1300, image_url: "sample1.png")
Item.create!(name: "商品2", points: 2200, image_url: "sample2.png")
Item.create!(name: "商品3", points: 3100, image_url: "sample3.png")

# --- 管理者アカウント作成 ---
admin_email = ENV["ADMIN_EMAIL"]
admin_password = ENV["ADMIN_PASSWORD"]

if admin_email.present? && admin_password.present?
  unless User.exists?(email: admin_email)
    User.create!(
      name: "管理者",
      email: admin_email,
      password: admin_password,
      admin: true
    )
    puts "管理者アカウントを作成しました: #{admin_email}"
  else
    puts "管理者アカウントはすでに存在します: #{admin_email}"
  end
else
  puts "ADMIN_EMAIL または ADMIN_PASSWORD が設定されていません。管理者アカウントは作成されません。"
end