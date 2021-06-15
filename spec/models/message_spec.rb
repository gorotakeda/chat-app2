require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe '新規メッセージが保存できる' do
    context '新規メッセージが保存できるとき' do
      it 'commntとimageが存在すれば保存できること' do
        expect(@message).to be_valid
      end
      it 'commntが空でも保存できること'do
        @message.commnt = ""
        expect(@message).to be_valid
      end
      it 'imageが空でも保存できること' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context '新規メッセージが保存できない時' do
      it 'commntとimageが空では保存できないこと' do
        @message.commnt = ""
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Commnt can't be blank")
      end
      it 'roomと紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
      it 'userと紐付いていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end