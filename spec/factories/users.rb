FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000' }
    password_confirmation { password }
    second_name           { 'あア阿' }
    first_name            { 'あア阿' }
    second_furigana       { 'カナ' }
    first_furigana        { 'カナ' }
    birthday              { '1111-11-11' }
  end
end
