require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '出品がうまくいくとき' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像を入力してください')
      end

      it 'product_nameが空では出品できないこと' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it 'descriptionが空では出品できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'valueが空では出品できないこと' do
        @item.value = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end

      it 'valueの値が300円未満では出品できないこと' do
        @item.value = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格の設定可能範囲外です')
      end

      it 'valueの値が9,999,999円以上では出品できないこと' do
        @item.value = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格の設定可能範囲外です')
      end

      it 'category_idが選択されていないと出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it 'state_idが選択されていないと出品できないこと' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it 'freight_idが選択されていないと出品できないこと' do
        @item.freight_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it 'shipment_region_idが選択されていないと出品できないこと' do
        @item.shipment_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it 'shipdate_idが選択されていないと出品できないこと' do
        @item.shipdate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
    end
  end
end
