class StaffMemberFormPresenter < FormPresenter
  def full_name_block(name1, name2, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      # optionsの中に:requiredキーが存在したならclass="required"を付与する
      m << label(name1, label_text,
        class: options[:required] ? 'required' : nil)
      m << text_field(name1, options)
      m << text_field(name2, options)
    end
  end
end
