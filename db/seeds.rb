Product.destroy_all
Product.create!([
  {id: 1, supplier_id: 1, name: "lwknot3.5elDb", price: 25, description: "1/32 inch by 3.5 inch white elastic loop with knot"},
  {id: 2, supplier_id: 1, name: "lwknot3.5elDw", price: 35, description: "1/32 inch by 3.5 inch white elastic loop with knot"},
  {id: 3, supplier_id: 1, name: "lwknot3.5elDgld", price: 40, description: "1/32 inch by 3.5 inch matte gold elastic loop with knot"},
  {id: 4, supplier_id: 1, name: "lwknot4stringDb", price: 35, description: "1/32 inch by 4 inch black string loop with knot"},
  {id: 5, supplier_id: 1, name: "lwknot4stringDw", price: 35, description: "1/32 inch by 4 inch white string loop with knot"},  
])

Supplier.destroy_all
Supplier.create!({id: 1, name: "Papillon", email: "info@papillon.com", phone: "555-555-5555"})

Image.destroy_all
Image.create!([
  {product_id: 1, src: "https://s3.amazonaws.com/ls-account-data-3-us-east-1/store-finish-line-custom-finishing-53e922c767901/themes/boxie/resources/img/elastic-loops/standard-hang-tag-loop-black-3.jpg"},
  {product_id: 2, src: "https://s3.amazonaws.com/ls-account-data-3-us-east-1/store-finish-line-custom-finishing-53e922c767901/themes/boxie/resources/img/elastic-loops/standard-hang-tag-loop-white-3.jpg"},
  {product_id: 2, src: "https://www.vinylenvelope.com/images/2410-2100_9inchclearloop.gif"},
  {product_id: 3, src: "https://s3.amazonaws.com/ls-account-data-3-us-east-1/store-finish-line-custom-finishing-53e922c767901/themes/boxie/resources/img/elastic-loops/standard-hang-tag-loop-matte-gold-3.jpg"},
  {product_id: 4, src: "https://s3.amazonaws.com/ls-account-data-3-us-east-1/store-finish-line-custom-finishing-53e922c767901/themes/boxie/resources/img/elastic-loops/cotton-hang-tag-loop-black-3.jpg"},
  {product_id: 5, src: "https://s3.amazonaws.com/ls-account-data-3-us-east-1/store-finish-line-custom-finishing-53e922c767901/themes/boxie/resources/img/elastic-loops/cotton-hang-tag-loop-white-3.jpg"}  
])