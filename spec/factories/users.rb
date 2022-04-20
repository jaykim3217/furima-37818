FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name            {'山'}
    last_name             {'田'}
    first_name_kana       {'ヤ'}
    last_name_kana        {'ナ'}
    birthday              {'1930-02-02'}
  end
end