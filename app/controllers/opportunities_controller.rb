class OpportunitiesController < ApplicationController
  def home
    @opportunities = Opportunity.all
  end
  def show
    @opportunity = Opportunity.find_by id: params[:id]
    @tags = @opportunity.tags
  end
end
