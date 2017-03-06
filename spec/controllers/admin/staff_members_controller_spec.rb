require 'rails_helper'

RSpec.describe Admin::StaffMembersController, type: :controller do

  let(:staff_member_params) { attributes_for(:staff_member) }

  describe '#create' do
    example '職員一覧ページにリダイレクト' do
      post :create, params: { staff_member: staff_member_params }
      expect(response).to redirect_to(admin_staff_members_url)
    end

    example '例外ActionController::ParameterMissingが発生' do
      bypass_rescue
      expect { post :create, params: nil }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
