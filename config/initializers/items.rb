Rails.application.config.after_initialize do
  if Item.count == 0
    Item.create!(name: "商品1", points: 1300, image_url: "sample1.png")
    Item.create!(name: "商品2", points: 2200, image_url: "sample2.png")
    Item.create!(name: "商品3", points: 3100, image_url: "sample3.png")
    Rails.logger.info "=== 初期商品を作成しました ==="
  else
    Rails.logger.info "=== 初期商品は既に存在します (#{Item.count} 件) ==="
  end
end
