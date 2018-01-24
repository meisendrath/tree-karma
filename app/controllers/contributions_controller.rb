class ContributionsController < ApplicationController
  view_accessor :resource
  
  before_action :authenticate_user!

  def new
    self.resource = Contribution.new
  end
end
