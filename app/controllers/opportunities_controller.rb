class OpportunitiesController < ApplicationController

  def home
    published_opportunities = Opportunity.where published: true
    if params[:search]
      print_opportunities = published_opportunities.search(params[:search])
    else
      print_opportunities = published_opportunities
    end
    @opportunities= print_opportunities.order(startdate: :asc)
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

    if @opportunity.save
      redirect_to @opportunity, :notice => "Your opportunity was created"
    else
      render "new"
     end
  end

  def destroy
    if current_user.role == "Curator"
      @opportunity = Opportunity.find_by id: params[:id]
    else
      @opportunity = current_user.opportunities.find_by id: params[:id]
    end
    @opportunity.delete

    redirect_to opportunities_path, :notice => "Your opportunity was deleted"
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
    if @opportunity.published == false
      @opportunity.update!(opportunity_params)
    end
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

  def unpublish
    @opportunity = Opportunity.find_by id: params[:id]
    @opportunity.update(:published => false)

    redirect_to opportunities_path
  end

  private
  def opportunity_params
    params.require(:opportunity).permit(:title, :description, :opportunity_type, :startdate, :duration, :location, :pic)
  end
end
