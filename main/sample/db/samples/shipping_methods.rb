begin
default_zone = Spree::Zone.find_by_name!("پیش‌فرض")
rescue ActiveRecord::RecordNotFound
  puts "Couldn't find default zone. Did you run `rake db:seed` first?"
  puts "That task will set up the countries, states and zones required for Spree."
  exit
end

shipping_category = Spree::ShippingCategory.find_or_create_by!(name: 'پیش‌فرض')

Spree::ShippingMethod.create!([
  {
    :name => "ارسال با پیک",
    :zones => [default_zone],
    :calculator => Spree::Calculator::Shipping::FlatRate.create!,
    :shipping_categories => [shipping_category]
  },
  {
    :name => "ارسال از طریق پست",
    :zones => [default_zone],
    :calculator => Spree::Calculator::Shipping::FlatRate.create!,
    :shipping_categories => [shipping_category]
  }
])

{
  "ارسال با پیک" => [200000, "ریال"],
  "ارسال از طریق پست" => [100000, "ریال"]
}.each do |shipping_method_name, (price, currency)|
  shipping_method = Spree::ShippingMethod.find_by_name!(shipping_method_name)
  shipping_method.calculator.preferences = {
    amount: price,
    currency: currency
  }
  shipping_method.calculator.save!
  shipping_method.save!
end
