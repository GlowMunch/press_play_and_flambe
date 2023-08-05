# FactoryBot.define do
#   factory :item do
#     name { Faker::DcComics.name}
#     description { Faker::Lorem.paragraph}
#     unit_price { Faker::Number.within(range: 1..50 )}
#     association :merchant, factory: :merchant
#   end

#   factory :invoice_item do
#     item_id { Faker::InvoiceItem.item_id}
#     invoice_id { Faker::InvoiceItem.invoice_id}
#     quantity { Faker::Number.within(range: 1..10 )}
#     unit_price { Faker::Number.within(range: 1..50 )}
#   end
# end