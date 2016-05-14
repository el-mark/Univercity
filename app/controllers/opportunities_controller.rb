class OpportunitiesController < ApplicationController

  def home
    @opportunities = Opportunity.all
  end

  def show
    @opportunity = Opportunity.find_by id: params[:id]
    @tags = @opportunity.tags
  end

  def index
    @opportunities = current_user.opportunities
  end

  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    @opportunity.save
    redirect_to @opportunity
  end

  private
    def opportunity_params
      params.require(:opportunity).permit(:title, :description, :organization, :opportunity_type, :startdate, :duration, :location)
    end
end
