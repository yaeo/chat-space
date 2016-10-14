require 'rails_helper'

describe Message do
  describe '#create' do
    #正常なメッセージが正常に保存されるか
    it "is valid with body" do
      message = build(:message)
      expect(message).to be_valid
    end
    #メッセージ本文がなかった場合
    it 'is invalid without a message body' do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("can't be blank")
    end
  end
end
