Order.create!([
  {quantity: 2, product_id: 6, user_id: 1, total_price: "19.6", tax: "1.62", subtotal: "17.98"},
  {quantity: 10, product_id: 9, user_id: 1, total_price: "92.5", tax: "7.6", subtotal: "84.9"},
  {quantity: 2, product_id: 1, user_id: 1, total_price: "2179.98", tax: "180.0", subtotal: "1999.98"},
  {quantity: 10, product_id: 3, user_id: 1, total_price: "21.69", tax: "1.79", subtotal: "19.9"}
])
Product.create!([
  {name: "Diapers", price: "999.99", description: "Your baby needs them, you know what they are, just buy them.", stock: nil, supplier_id: 1},
  {name: "Baby Clothes", price: "10.0", description: "Simply adorable.  The ooos and cutes will abound.  These clothes are easy to wash and easy to get on and off, well, as easy they can be.  They'll outgrow them in a month anyway, so just buy them.", stock: nil, supplier_id: 1},
  {name: "Pacifiers", price: "1.99", description: "These will be a godsend at times.  While they may be thrown at you, and are easily lost, you will not regret purchasing these pacifiers - just buy them!", stock: nil, supplier_id: 1},
  {name: "Beer", price: "15.0", description: "You need some, you know what it is, just buy some.", stock: nil, supplier_id: 2},
  {name: "DiGiorno frozen pizza", price: "4.99", description: "Time for you eat?  Ha!  If you're lucky maybe a meal over the sink, but have a few of these frozen pizzas on hand, you'll thank me later.", stock: nil, supplier_id: 3},
  {name: "Wine", price: "8.99", description: "Sometimes mom needs a glass of wine.  Or sometimes anyone could use a glass of wine!  Don't wait for oxygenation, just enjoy!", stock: nil, supplier_id: 2},
  {name: "Bananas", price: "3.5", description: "They're a quick heathy snack, good for breakfast, or during the day.  Get your nutrients, be healthy, it helps.", stock: nil, supplier_id: 3},
  {name: "Chocolate", price: "7.29", description: "When you need a boost, or just something sweet, nothing beats chocolate.", stock: nil, supplier_id: 3},
  {name: "Baby Wipes", price: "8.49", description: "Clean everything with them!  Everything will need cleaning.", stock: nil, supplier_id: 1}
])
ProductImage.create!([
  {image_url: "http://www.greenmountaindiapers.com/images/T/ss%20bloom%20LR%20png.png", product_id: "1"},
  {image_url: "http://images.philips.com/is/image/PhilipsConsumer/SCF190_01-IMS-en_US?wid=380&hei=335&$pnglarge$", product_id: "3"},
  {image_url: "http://4.bp.blogspot.com/-1KFFnlsdP_A/TwXPUqAsRhI/AAAAAAAABwM/92F7OjVFqhg/s1600/clothes+line+colored.png", product_id: "2"},
  {image_url: "http://pngimg.com/upload/beer_PNG2371.png", product_id: "4"},
  {image_url: "http://www.digiorno.com/content/images/products/11196-box-l.png", product_id: "5"},
  {image_url: "http://pngimg.com/upload/glass_PNG2919.png", product_id: "6"},
  {image_url: "http://pngimg.com/upload/banana_PNG845.png", product_id: "7"},
  {image_url: "http://pngimg.com/upload/chocolate_PNG29.png", product_id: "8"},
  {image_url: "http://pngimg.com/upload/small/beer_PNG2388.png", product_id: "4"},
  {image_url: "http://pngimg.com/upload/small/beer_PNG2379.png", product_id: "4"},
  {image_url: "http://media25.pampers.com/en_US/images/pc/hb/lsp/products/prod_image_main_wipes_babyfresh.png", product_id: "9"},
  {image_url: "http://nb9.stumbleupon.netdna-cdn.com/lvG8TtqV5u5GrcbwYk3iyQ", product_id: "10"},
  {image_url: "http://nb9.stumbleupon.netdna-cdn.com/lvG8TtqV5u5GrcbwYk3iyQ", product_id: "11"}
])
Supplier.create!([
  {name: "Amazon", email: "amazon@amazon.com", phone: "0987654321"},
  {name: "Duff's", email: "duffman@duff.com", phone: "5554443322"},
  {name: "Grocery Store", email: "groceries@market.com", phone: "9998887766"}
])
