require 'rails_helper'

describe MessagesController do

  before do
    @user = create(:user)
    sign_in @user
  end

  describe 'POST #create' do

    let!(:message) { build(:message) }
    let!(:message_params) {{body: message.body}}
    let!(:invalid_message_params) {{body: ""}}

    #新規メッセージが正常に保存されるかどうか
    it 'create a new message' do
      expect {
        post :create, params: { message: message_params }
      }.to change(Message, :count).by(1)
    end

    #メッセージの作成に成功したあとはroot_pathにリダイレクト
    it 'render root tamplate when message is created' do
      post :create, params: { message: message_params }
      expect(response).to redirect_to root_path
    end

    #本文が入っていない場合は保存に失敗する
    it 'doesnt create a new message with blank body' do
      expect {
        post :create, params: { message: invalid_message_params }
      }.not_to change(Message, :count)
    end

    #メッセージの作成に失敗した場合はroot_pathにリダイレクト
    it 'render root template when message is failed to be created' do
      post :create, params: { message: invalid_message_params }
      expect(response).to redirect_to root_path
    end

    #メッセージの作成に失敗した場合はflsh[:error]にメッセージが保存される
    it 'flash[:empty] is set when fail to post a message' do
      post :create, params: { message: invalid_message_params }
      expect(flash[:error]).not_to be_empty
    end
  end


end
