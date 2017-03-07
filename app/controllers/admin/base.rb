class Admin::Base < ApplicationController
  before_action :authorize

  private
  def current_administrator
    if session[:administrator_id]
      @current_administrator ||= Administrator.find_by(id: session[:administrator_id])
    end
  end

  # app/helpers/application_helper.rbに定義するのと同じ効果
  # ERBテンプレートの中で利用できるようになる
  helper_method :current_administrator

  def authorize
    unless current_administrator
      flash.notice = '管理者としてログインしてください'
      redirect_to :admin_login
    end
  end
end
