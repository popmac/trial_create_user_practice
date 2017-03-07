require 'rails_helper'

RSpec.describe Admin::TopController, type: :controller do
  context 'ログイン後' do

    let(:administrator) { create(:administrator) }

    before do
      session[:administrator_id] = administrator.id
    end

    describe '#index' do
      example '通常はstaff/top/dashboard' do
        get :index
        expect(response).to render_template('admin/top/dashboard')
      end

      example '停止フラグがセットされたら強制的にログアウト' do
        administrator.update_column(:suspended, true)
        get :index
        expect(session[:administrator_id]).to be_nil
        expect(response).to redirect_to(admin_root_url)
      end
    end
  end
end
