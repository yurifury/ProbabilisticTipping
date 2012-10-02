class CompetitionsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :participate_in, :unparticipate_in]
  before_filter :find_competition, only: [:show, :edit, :update, :participate_in, :unparticipate_in]
  before_filter :check_owner, only: [:edit, :update]

  def new
    @competition = current_user.owned_competitions.new
  end

  def create
    @competition = current_user.owned_competitions.new(params[:competition])
    if @competition.save
      redirect_to @competition, notice: "Competition created!"
    else
      render "new"
    end
  end

  def show
  end

  def index
    @competitions = Competition.all
  end

  def edit
  end

  def update
    if @competition.update_attributes(params[:competition])
      flash[:success] = "Competition updated"
      redirect_to @competition
    else
      render 'edit'
    end
  end

  def participate_in
    current_user.participate_in @competition
    redirect_to @competition
  end

  def unparticipate_in
    current_user.unparticipate_in @competition
    redirect_to @competition
  end

  private
    def find_competition
      @competition = Competition.find(params[:id])
    end

    def check_owner
      @competition = Competition.find(params[:id])
      redirect_to root_path, alert: "You can't do that!" unless current_user?(@competition.owner)
    end
end
