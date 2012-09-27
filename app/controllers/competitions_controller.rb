class CompetitionsController < ApplicationController
  before_filter :authorize, only: [:new, :create]

  def new
    @competition = current_user.competitions.new
  end

  def create
    @competition = current_user.competitions.new(params[:competition])
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
end
