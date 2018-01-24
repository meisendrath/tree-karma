class Partner::PlantedTreesController < ApplicationController
  view_accessor :resource

  before_action :authenticate_user!
  before_action :partner_user!

  def new
    self.resource = PlantedTree.new
  end

  def create
    contribution = Contribution.find(params[:contribution_id])

    raise 'Contribution status is not valid' unless contribution.accepted?
    raise 'You are not authorized for this contribution' unless contribution.partner == current_user.partner

    planted_tree = PlantedTree.new(planted_tree_params)
    planted_tree.planted_date = Date.current

    ContributionService.make_completed!(
      contribution,
      planted_tree
    )

    ContributionService.anchor_to_blockchain!(contribution)

    redirect_to partner_contributions_path
  rescue => e
    flash[:error] = e.message
    redirect_to new_partner_contribution_planted_tree_path
  end

  private

  def planted_tree_params
    params.require(:planted_tree).permit(
      :name,
      { location_attributes: [:latitude, :longitude] },
      :image,
      :planted_age_years
    )
  end
end
