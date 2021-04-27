FactoryBot.define do
  factory :buy_address do
    user_id {1}
    item_id {1}
    token {ENV["PAYJP_PUBLIC_KEY"]}
    postal_code {'123-4567'}
    from_id {3}
    city {'横浜市緑区'}
    address {'青山1-1-1'}
    build_name {'柳ビル103'}
    phone {'09000000000'}
  end
end
