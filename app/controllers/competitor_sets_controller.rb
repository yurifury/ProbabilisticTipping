class CompetitorSetsController < ApplicationController
  before_filter :authorize, only: [:new, :create]
  before_filter :find_competitor_set, only: [:show, :edit, :update]
  before_filter :check_owner, only: [:edit, :update]

  def new
    @cset = current_user.competitor_sets.new
  end

  def create
    @cset = current_user.competitor_sets.new(params[:competitor_set])
    if @cset.save
      redirect_to @cset, notice: "Competitor Set created!"
    else
      render "new"
    end
  end

  def show
  end

  def index
    @csets = CompetitorSet.all
  end

  def edit
  end

  def update
    if @cset.update_attributes(params[:competitor_set])
      flash[:success] = "Competitor set updated"
      redirect_to @cset
    else
      render 'edit'
    end
  end

  private
    def find_competitor_set
      @cset = CompetitorSet.find(params[:id])
    end

    def check_owner
      @cset = CompetitorSet.find(params[:id])
      redirect_to root_path, alert: "You can't do that!" unless current_user?(@cset.owner)
    end
end
