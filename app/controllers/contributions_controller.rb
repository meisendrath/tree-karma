class ContributionsController < ApplicationController
  view_accessor :resource, :resources

  before_action :authenticate_user!

  def new
    self.resource = Contribution.new
  end

  def index
    self.resources = current_user.contributor.contributions
  end

  def create
    quantity = params[:quantity].to_i
    stripe_token = params[:stripe_token]

    ApplicationRecord.transaction do
      resources = ContributionService.create_temporal!(current_user.contributor, quantity)

      stripe_charge = StripeService.create_charge!(resources, stripe_token)

      ContributionService.make_pending!(resources, stripe_charge.id)
    end

    redirect_to contributions_path
  rescue => e
    flash[:error] = e.message
    redirect_to new_contribution_path
  end
end
