class Admin::StaffEventsController < Admin::Base
  # リソースがネストされている場合とされていない場合の両方に対応している
  # ネストされているかどうかはstaff_member_idパラメーターに値がセットされているかどうかで判定
  def index
    if params[:staff_member_id]
      @staff_member = StaffMember.find(params[:staff_member_id])
      @events = @staff_member.events
    else
      # この時点では@eventsの中身は、StaffEvent(id: integer, staff_member_id: integer, type: string, created_at: datetime)、となっている
      @events = StaffEvent
    end
    @events = @events.order(occurred_at: :desc)
    # belongs_to :memberを設定しているので以下のように(:member)と書いている
    @events = @events.includes(:member)
    @events = @events.page(params[:page])
  end
end
