class Staff::SessionsController < Staff::Base
  skip_before_action :authorize

  def new
    if current_staff_member
      redirect_to staff_root
    else
      @form = Staff::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Staff::LoginForm.new(staff_login_form_params)
    if @form.email.present?
      staff_member = StaffMember.find_by(email_for_index: @form.email.downcase)
    end
    if Staff::Authenticator.new(staff_member).authenticate(@form.password)
      if staff_member.suspended?
        flash.now.alert = 'アカウントが停止されています'
        render action: 'new'
      else
        session[:staff_member_id] = staff_member.id
        flash.notice = 'ログインしました'
        redirect_to :staff_root
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:staff_member_id)
    flash.notice = 'ログアウトしました'
    redirect_to :staff_root
  end

  private
  def staff_login_form_params
    params.require(:staff_login_form).permit(:email, :password)
  end
end
