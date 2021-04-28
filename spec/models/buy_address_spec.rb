require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
      sleep(1) 
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'build_nameが空でもl保存できる' do
        @buy_address.build_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていないと保存できない' do
        @buy_address.postal_code = '11111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角数字でないと保存できない' do
        @buy_address.postal_code = '１１１-１１１１'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'from_idが1だと保存できない' do
        @buy_address.from_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("From can't be blank")
      end
      it 'cityが空だと保存できない' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'build_nameが空でも保存できる' do
        @buy_address.build_name = ''
        expect(@buy_address).to be_valid
      end
      it 'addressが空だと保存できない' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できない' do
        @buy_address.phone = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが11文字以上だと保存できない' do
        @buy_address.phone = '1111111111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it 'phoneが半角数字以外だと保存できない' do
        @buy_address.phone = '１１１１１１１１１１１'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空では保存できない' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
