require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context '商品が出品できる場合' do
      it 'product, explain, category_id, condition_id, post_price_id, region_id, delivery_day_id, price, imageが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'productが空では出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explainが空では出品できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の詳細を入力してください")
      end
      it 'categoryが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'conditionが空では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'post_priceが空では出品できない' do
        @item.post_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'regionが空では出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'delivery_dayが空では出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが300円より低い場合は出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceが9,999,999円より高い場合は出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it 'priceは半角数値のみ保存可能であること' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
