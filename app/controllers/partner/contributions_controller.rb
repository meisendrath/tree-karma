class Partner::ContributionsController < ApplicationController
  view_accessor :resources, :resource

  before_action :authenticate_user!
  before_action :partner_user!
  before_action :find_resource, only: [:accept, :show]

  def index
    self.resources = Contribution.pending.to_a
    self.resources += Contribution.accepted.where(partner: current_user.partner).to_a
    self.resources += Contribution.completed.where(partner: current_user.partner).to_a
  end

  def accept
    ContributionService.make_accepted!(resource, current_user)
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
