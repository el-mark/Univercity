class OpportunitiesController < ApplicationController
  def home
    opportunities = Opportunity.where published: true
    @opportunities = opportunities.order(startdate: :asc)
  end
  def show
    @opportunity = Opportunity.find_by id: params[:id]
    @tags = @opportunity.tags
  end
  def index
    if current_user.role == "Curator"
      opportunities = Opportunity.all
    else
      opportunities = current_user.opportunities
    end
    opportunities_in_order = opportunities.order(startdate: :asc)
    @not_published_yet = opportunities_in_order.where published: false
    @published = opportunities_in_order.where published: true
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
    if current_user.role == "Curator"
      @opportunity = Opportunity.find_by id: params[:id]
    else
      @opportunity = current_user.opportunities.find_by id: params[:id]
    end
    @opportunity.delete

    redirect_to opportunities_path
  end
  def edit
    if current_user.role == "Curator"
      @opportunity = Opportunity.find(params[:id])
    else
      @opportunity = current_user.opportunities.find(params[:id])
    end
  end
  def update
    if current_user.role == "Curator"
      @opportunity = Opportunity.find(params[:id])
    else
      @opportunity = current_user.opportunities.find(params[:id])
    end
    @opportunity.update!(opportunity_params)

    redirect_to opportunities_path
  end
  def approvals
    opportunities = Opportunity.where published: false
    @opportunities = opportunities.order(created_at: :desc)
  end
  def publish
    if current_user.role == "Curator"
      @opportunity = Opportunity.find_by id: params[:id]
      @opportunity.update(:published => true)
    end

    redirect_to opportunities_path
  end
  def un_publish
    if current_user.role == "Curator"
      @opportunity = Opportunity.find_by id: params[:id]
      @opportunity.update(:published => false)
    end

    redirect_to opportunities_path
  end

  private
  def opportunity_params
    params.require(:opportunity).permit(:title, :description, :organization, :opportunity_type, :startdate, :duration, :location, :pic)
  end
end
