FactoryBot.define do
  factory :buy_address do
    postal_code      { '123-4567' }
    region_id        {2}
    address_number   { 'addressnumber' }
    city             { ' city' }
    building         { 'building' }
    phone_number     { '08012345678' }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
