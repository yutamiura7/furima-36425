require 'rails_helper'

RSpec.describe BuyShippingaddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_shippingaddress = FactoryBot.build(:buy_shippingaddress, user_id: user.id, item_id: item.id)
      sleep 0.5
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_shippingaddress).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_shippingaddress.building = ''
        expect(@buy_shippingaddress).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postalcodeが空だと保存できないこと' do
        @buy_shippingaddress.postalcode = ''
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Postalcode can't be blank")
      end
      it 'postalcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_shippingaddress.postalcode = '1234567'
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Postalcode is invalid")
      end
      it 'postalcodeが半角のハイフンを含んだ全角文字列では保存できないこと' do
        @buy_shippingaddress.postalcode = '１２３-４５６７'
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Postalcode is invalid")
      end
      it 'area_idが1では出品できない' do
        @buy_shippingaddress.area_id = 1
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @buy_shippingaddress.municipalities = ''
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buy_shippingaddress.address = ''
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @buy_shippingaddress.phone = ''
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9桁以下だと保存できないこと' do
        @buy_shippingaddress.phone = '123456789'
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが12桁以上だと保存できないこと' do
        @buy_shippingaddress.phone = '123456789012'
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが全角数値だと保存できないこと' do
        @buy_shippingaddress.phone = '０９０１２３４５６７８'
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneに半角数値以外を用いると保存できないこと' do
        @buy_shippingaddress.phone = '03-12345678'
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空だと保存できないこと' do
        @buy_shippingaddress.token = ''
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ保存できない' do
        @buy_shippingaddress.user_id = nil
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ保存できない' do
        @buy_shippingaddress.item_id = nil
        @buy_shippingaddress.valid?
        expect(@buy_shippingaddress.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
