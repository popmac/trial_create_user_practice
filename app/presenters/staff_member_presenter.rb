class StaffMemberPresenter < ModelPresenter
  delegate :suspended?, to: :object
  # 職員の停止フラグのOn/Offを表現する記号を返す
  #   On: BALLOT BOX WITH CHECK (U+2611)
  #   Off: BALLOT BOX (U+2610)

  def full_name
    object.family_name + ' ' + object.given_name
  end

  def full_name_kana
    object.family_name_kana + ' ' + object.given_name_kana
  end

  def suspended_mark
    # trueならば左側、falseなら右側の値が埋め込まれる
    # rawメソッドで&がエスケープ処理されないように制御している
    suspended? ? raw('&#x2611') : raw('&#x2610')
  end
end
