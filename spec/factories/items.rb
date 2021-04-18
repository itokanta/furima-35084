FactoryBot.define do
  factory :item do
    name         {Faker::FunnyName.two_word_name}
    category_id  {'2'}
    status_id    {'2'}
    description  {Faker::Lorem.sentence}
    postage_id   {'2'}
    from_id      {'2'}
    sendabout_id {'2'}
    price        {'1000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
