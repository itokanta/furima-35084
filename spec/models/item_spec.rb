require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item= FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'name、category_id、status_id、description、postage_id、from_id、sendabout_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '販売価格が¥300~¥9,999,999の間であり、かつ半角数字のみで入力されていれば保存できる' do
        @item.price = '10000'
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'status_idが空では保存できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it 'postage_idが空では保存できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage is not a number")
      end
      it 'from_idが空では保存できない' do
        @item.from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("From is not a number")
      end
      it 'sendabout_idが空では保存できない' do
        @item.sendabout_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sendabout is not a number")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it  'priceが300未満では保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10,000,000以上では保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字以外では保存できない' do
        @item.price = 'あ１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
