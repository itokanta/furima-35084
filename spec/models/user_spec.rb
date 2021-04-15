require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、second_name、first_name、second_furigana、first_furigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが半角英数字混合であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致していれば登録できる' do
        @user.password = @user.password_confirmation
        expect(@user).to be_valid
      end
      it 'second_nameとfirst_nameが全角(漢字・ひらがな・カタカナ)で入力されていれば登録できる' do
        @user.second_name = 'あア阿'
        @user.first_name = 'あア阿'
        expect(@user).to be_valid
      end
      it 'second_furiganaとfirst_furiganaが全角(カタカナ)で入力されていれば登録できる' do
        @user.second_furigana = 'カナ'
        @user.first_furigana = 'カナ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含んでいないと登録できない' do
        @user.email = 'eeeeeee'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ａａａ０００'
        @user.password_confirmation = 'ａａａ０００'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'second_nameが半角だと入力できない' do
        @user.second_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name is invalid')
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'second_furiganaが半角だと登録できない' do
        @user.second_furigana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second furigana is invalid')
      end
      it 'first_furiganaが半角だと登録できない' do
        @user.first_furigana = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First furigana is invalid')
      end
      it 'second_nameが英数字だと登録できない' do
        @user.second_name = 'aa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name is invalid')
      end
      it 'first_nameが英数字だと登録できない' do
        @user.first_name = 'aa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'second_furiganaが漢字・ひらがなだと登録できない' do
        @user.second_furigana = 'ああ阿阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second furigana is invalid')
      end
      it 'first_furiganaが漢字・ひらがなだと登録できない' do
        @user.first_furigana = 'ああ阿阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('First furigana is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'second_nameが空だと登録できない' do
        @user.second_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'second_furiganaが空だと登録できない' do
        @user.second_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second furigana can't be blank")
      end
      it 'first_furiganaが空だと登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end
    end
  end
end
