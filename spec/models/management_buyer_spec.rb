require 'rails_helper'

RSpec.describe ManagementBuyer, type: :model do
  describe '商品購入機能' do
    before do
      @management_buyer = FactoryBot.build(:management_buyer)
    end

    context '購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@management_buyer).to be_valid
      end

      it 'buildint_nameが空でも購入できる' do
        @management_buyer.building_name = nil
        expect(@management_buyer).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空では購入できないこと' do
        @management_buyer.token = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('カード情報を入力してください')
      end

      it 'postal_codeが空では購入できないこと' do
        @management_buyer.postal_code = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('郵便番号を入力してください')
      end

      it 'postal_codeに半角のハイフンが含まれていないと購入できないこと' do
        @management_buyer.postal_code = '1234567'
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('郵便番号を正しく入力してください')
      end

      it 'region_idが空では購入できないこと' do
        @management_buyer.region_id = 1
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('都道府県を選択してください')
      end

      it 'cityが空では購入できないこと' do
        @management_buyer.city = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('市区町村を入力してください')
      end

      it 'addressが空では購入できないこと' do
        @management_buyer.address = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('番地を入力してください')
      end

      it 'phone_numが空では購入できないこと' do
        @management_buyer.phone_num = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('電話番号を入力してください')
      end

      it 'phone_numが11桁以上では購入できないこと' do
        @management_buyer.phone_num = '123456789101'
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end

      it 'phone_numにハイフンが含まれていると購入できない' do
        @management_buyer.phone_num = '123-4567'
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('電話番号は数値で入力してください')
      end
    end
  end
end
