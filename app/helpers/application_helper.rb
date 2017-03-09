module ApplicationHelper
  include HtmlBuilder

  def document_title
    if @title.present?
      "#{@title} | TrialCreateUserPractice"
    else
      'TrialCreateUserPractice'
    end
  end
end
