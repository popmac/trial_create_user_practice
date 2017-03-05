module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} | TrialCreateUserPractice"
    else
      'TrialCreateUserPractice'
    end
  end
end
