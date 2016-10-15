require 'rails_helper'

describe GroupsController do

  before do
    @user = create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    #indexテンプレートが表示されるかどうか
    it 'render the :index template' do
      get :index
      expect(response).to render_template :index
    end
    #新しいMessageインスタンスが作成されているかどうか
    it 'assigns a new message to @message' do
      get :index
      expect(assigns(:message)).to be_a_new(Message)
    end
  end
end
