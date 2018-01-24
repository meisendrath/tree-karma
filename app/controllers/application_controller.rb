class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:email, contributor_attributes: [:first_name, :last_name]]
    )
  end

  private

  def self.view_accessor(*names)
    attr_accessor *names
    helper_method *names
  end

  def contributor_user!
    redirect_to root_path unless current_user.try(:contributor?)
  end

  def partner_user!
    redirect_to root_path unless current_user.try(:partner?)
  end

  def not_contributor_user!
    redirect_to root_path if current_user.try(:contributor?)
  end

  def not_partner_user!
    redirect_to root_path if current_user.try(:partner?)
  end
end
