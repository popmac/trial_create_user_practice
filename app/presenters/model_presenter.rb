class ModelPresenter
  attr_accessor :object, :view_context

  def initialize(object, view_context)
    @object = object
    @view_context = view_context
  end
end
