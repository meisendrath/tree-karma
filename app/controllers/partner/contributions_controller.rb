class Partner::ContributionsController < ApplicationController
  view_accessor :resources, :resource

  before_action :authenticate_user!
  before_action :partner_user!
  before_action :find_resource, only: :accept

  def index
    self.resources = Contribution.pending.to_a
    self.resources += Contribution.accepted.where(partner: current_user.partner).to_a
    self.resources += Contribution.completed.where(partner: current_user.partner).to_a
  end

  def accept
    resource.update!(
      status: :accepted,
      partner: current_user.partner
    )
  rescue => e
    flash[:error] = e.message
  ensure
    redirect_back fallback_location: resource
  end

  private

  def find_resource
    self.resource = Contribution.find(params[:id])
  end
end