require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '出品がうまくいくとき' do
      it 'image、product_name、description、value、category_id、state_id、freight_id、shipment_region_id、shipdate_idがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'product_nameが空では出品できないこと' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'descriptionが空では出品できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'valueが空では出品できないこと' do
        @item.value = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end

      it 'valueの値が300円未満では出品できないこと' do
        @item.value = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Value Out of setting range")
      end

      it 'valueの値が9,999,999円以上では出品できないこと' do
        @item.value = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Value Out of setting range")
      end

      it 'category_idが選択されていないと出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'state_idが選択されていないと出品できないこと' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State Select")
      end

      it 'freight_idが選択されていないと出品できないこと' do
        @item.freight_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight Select")
      end

      it 'shipment_region_idが選択されていないと出品できないこと' do
        @item.shipment_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment region Select")
      end

      it 'shipdate_idが選択されていないと出品できないこと' do
        @item.shipdate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate Select")
      end
    end
  end
end
