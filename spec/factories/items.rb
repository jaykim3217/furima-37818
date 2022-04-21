FactoryBot.define do
  factory :item do
    product          {Faker::Lorem.sentence}
    explain          {Faker::Lorem.sentence}
    category_id      {2}
    condition_id     {2}
    post_price_id    {2}
    region_id        {2}
    delivery_day_id  {2}
    price            {400}
    association :user 
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
  end
end

