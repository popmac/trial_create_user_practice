class Staff::Authenticator
  def initialize(staff_member)
    @staff_member = staff_member
  end

  def authenticate(raw_password)
    @staff_member &&
      @staff_member.hashed_password &&
      # 開始日が今日か、今日より前
      @staff_member.start_date <= Date.today &&
      # 終了日が設定されていないか、今日より後()今日より前ということは、既に終了している)
      (@staff_member.end_date.nil? || @staff_member.end_date > Date.today) &&
      # 下記の==は比較演算子ではなく、BCrypt::Passwordオブジェクトのインスタンスメソッド
      # 引数に指定された平文のパスワードをハッシュ関数で計算し、自分自身の保持しているハッシュ値と同じであればtrueを返す
      BCrypt::Password.new(@staff_member.hashed_password) == raw_password
  end
end
