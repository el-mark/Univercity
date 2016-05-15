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
    @opportunity = current_user.opportunities.new(opportunity_params)

    @opportunity.save
    redirect_to @opportunity
  end

  def destroy
    @opportunity = current_user.opportunities.find_by id: params[:id]
    @opportunity.delete

    redirect_to opportunities_path
  end

  def edit
    @opportunity = current_user.opportunities.find(params[:id])
  end

  def update
    @opportunity = current_user.opportunities.find(params[:id])
    @opportunity.update!(opportunity_params)

    redirect_to opportunities_path

  end

  private
    def opportunity_params
      params.require(:opportunity).permit(:title, :description, :organization, :opportunity_type, :startdate, :duration, :location)
    end
end
