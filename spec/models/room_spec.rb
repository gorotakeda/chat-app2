require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe '新規ルーム登録' do
    context '新規ルーム登録ができる時' do
      it 'nameの値が存在すれば登録できること'do
        expect(@room).to be_valid
      end
    end
    context '新規ルームが登録できない時' do
      it 'nameが空では登録できないこと' do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end    
  end

end
