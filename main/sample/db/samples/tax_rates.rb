default_zone = Spree::Zone.find_by_name!("پیش‌فرض")
vat_tax = Spree::TaxCategory.find_by_name!("مالیات بر ارزش افزوده (VAT)")
tax_rate = Spree::TaxRate.create(
  :name => "مالیات پیش‌فرض",
  :zone => default_zone, 
  :amount => 0.06,
  :tax_category => vat_tax)
tax_rate.calculator = Spree::Calculator::DefaultTax.create!
tax_rate.save!
