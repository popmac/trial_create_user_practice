class Admin::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_timeout

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

  def check_account
    if current_administrator && current_administrator.suspended?
      session.delete(:administrator_id)
      flash.alert = 'アカウントが無効になりました'
      redirect_to :admin_root
    end
  end

  TIMEOUT = 60.minutes

  def check_timeout
    if current_administrator
      # 最後にアクセスした時刻が現在から60分前の時刻よりも進んでいる場合
      # つまり、最後にアクセスしてから60分以内の場合
      if session[:last_access_time] >= TIMEOUT.ago
        # 最終アクセス時刻を更新
        session[:last_access_time] = Time.current
      else
        session.delete(:administrator_id)
        flash.alert = 'セッションがタイムアウトしました'
        redirect_to :admin_login
      end
    end
  end
end
