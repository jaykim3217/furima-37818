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
      it 'buildingが空でも保存できる' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが存在しない場合は保存できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁の半角文字列のみ出なければ保存でいない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'region_idがないと保存できない' do
        @buy_address.region_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'address_numberがないと保存できない' do
        @buy_address.address_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberがないと保存できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")        
      end
      it 'phone_numberが12以上なら保存できない' do
        @buy_address.phone_number = '123456789101'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに半角数字以外の文字が含まれたら保存できない' do
        @buy_address.phone_number = '1234５678910'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていなければ購入できない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'token(クレジットカード情報がなければ購入できない' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
