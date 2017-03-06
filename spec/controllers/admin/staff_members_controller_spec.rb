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

  describe '#update' do
    let(:staff_member) { create(:staff_member) }

    example 'suspendedフラグをセットする' do
      staff_member_params.merge!(suspended: true)
      patch :update, params: { id: staff_member.id, staff_member: staff_member_params }
      staff_member.reload
      expect(staff_member).to be_suspended
    end

    example 'hashed_passwordの値は書き換え不可' do
      staff_member_params.delete(:password)
      staff_member_params.merge!(hashed_password: 'x')
      expect {
        patch :update, params: { id: staff_member.id, staff_member: staff_member_params }
      }.not_to change { staff_member.hashed_password.to_s }
    end
  end
end
