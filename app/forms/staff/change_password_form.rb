class Staff::ChangePasswordForm
  include ActiveModel::Model

  attr_accessor :object, :current_password, :new_password,
    :new_password_confirmation

  # 属性の名前に_confirmationを付加した名前を持つ属性とを比較して、値が一致しなければバリデーションが失敗する
  validates :new_password, presence: true, confirmation: true

  # 以下はカスタムバリデーションのカスタムメソッド
  # ユーザーが入力した現在のパスワードが正しいかどうかをチェック
  validate do
    unless Staff::Authenticator.new(object).authenticate(current_password)
      errors.add(:current_password, :wrong)
    end
  end

  def save
    # バリデーションを実行して、trueならばsaveメソッドを実行
    if valid?
      object.password = new_password
      object.save
    end
  end
end
