class CompetitionsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :participate, :unparticipate]

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
    @competition = Competition.find(params[:id])
  end

  def index
    @competitions = Competition.all
  end

  def participate_in
    competition = Competition.find(params[:id])
    current_user.participate_in competition
    redirect_to competition
  end

  def unparticipate_in
    competition = Competition.find(params[:id])
    current_user.unparticipate_in competition
    redirect_to competition
  end
end
