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
        expect(@management_buyer.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できないこと' do
        @management_buyer.postal_code = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに半角のハイフンが含まれていないと購入できないこと' do
        @management_buyer.postal_code = '1234567'
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('Postal code input correctly')
      end

      it 'region_idが空では購入できないこと' do
        @management_buyer.region_id = 1
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('Region select')
      end

      it 'cityが空では購入できないこと' do
        @management_buyer.city = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できないこと' do
        @management_buyer.address = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空では購入できないこと' do
        @management_buyer.phone_num = nil
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが11桁以上では購入できないこと' do
        @management_buyer.phone_num = '123456789101'
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('Phone num is too long (maximum is 11 characters)')
      end

      it 'phone_numにハイフンが含まれていると購入できない' do
        @management_buyer.phone_num = '123-4567'
        @management_buyer.valid?
        expect(@management_buyer.errors.full_messages).to include('Phone num is not a number')
      end
    end
  end
end
