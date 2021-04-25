require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
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
      # it 'from_idが1だと保存できない' do
      #   @buy_address.from_id = 1
      #   @buy_address.valid?
      #   expect(@buy_address.errors.full_messages).to include("From can't be blank")
      # end
    end
  end
end
