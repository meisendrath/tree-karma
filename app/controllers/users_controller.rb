class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :not_partner_user!, only: [:become_partner, :make_partner]

  def make_partner
    permitted_params = params.require(:user).permit(
      partner_attributes: [
        :company_name,
        { location_attributes: [:latitude, :longitude] }
      ]
    )
    current_user.update!(permitted_params)
    redirect_to partner_contributions_path
  rescue => e
    flash[:error] = e.message
    redirect_to become_partner_path
  end
end
