require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user, item_id: item)
    sleep 0.1
  end

  describe '購入機能' do
    context '購入できる場合' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@buy_address).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが存在しない場合は保存できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが3桁ハイフン4桁の半角文字列のみ出なければ保存でいない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("郵便番号をハイフン(-)を含めて正しく入力してください")
      end
      it 'region_idがないと保存できない' do
        @buy_address.region_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("発送先を入力してください")
      end
      it 'address_numberがないと保存できない' do
        @buy_address.address_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberがないと保存できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号を入力してください")        
      end
      it 'phone_numberが12以上なら保存できない' do
        @buy_address.phone_number = '123456789101'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが9以下なら保存できない' do
        @buy_address.phone_number = '123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberに半角数字以外の文字が含まれたら保存できない' do
        @buy_address.phone_number = '1234５678910'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'userが紐付いていなければ購入できない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていなければ購入できない' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'token(クレジットカード情報がなければ購入できない' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
