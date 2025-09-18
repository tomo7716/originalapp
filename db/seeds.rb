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
if ENV["ADMIN_EMAIL"].present? && ENV["ADMIN_PASSWORD"].present?
  unless User.exists?(email: ENV["ADMIN_EMAIL"])
    User.create!(
      name: "管理者",
      email: ENV["ADMIN_EMAIL"],
      password: ENV["ADMIN_PASSWORD"],
      password_confirmation: ENV["ADMIN_PASSWORD"],
      admin: true
    )
    puts "管理者アカウント作成完了"
  else
    puts "管理者アカウントは既に存在します"
  end
end