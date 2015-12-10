Spree::PaymentMethod::Check.create!(
  {
    name: "نقدی",
    description: "پرداخت با استفاده از پول نقد",
    active: true
  }
)

Spree::Gateway::Bogus.create!(
  {
    name: "کارت بانکی",
    description: "پرداخت با استفاده از دستگاه کارت‌خوان و کارت‌های بانکی عضو شتاب",
    active: true
  }
)

Spree::PaymentMethod::Check.create!(
  {
    name: "چک",
    description: "پرداخت با استفاده از چک",
    active: true
  }
)

Spree::Gateway::Bogus.create!(
  {
    name: "اینترنتی",
    description: "پرداخت با استفاده از درگاه پرداخت اینترنتی و کارت‌های بانکی عضو شتاب",
    active: true
  }
)
