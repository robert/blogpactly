class UserDecorator < Draper::Decorator
  delegate_all

  def relative_name
    model.name == current_user.name ? "You" : model.name
  end

end
