class RoundsController < ApplicationController
  before_filter :find_competition, only: [:new, :create, :show, :edit, :update]
  before_filter :check_owner, only: [:new, :create, :edit, :update]

  def new
    @round = @competition.rounds.build
  end

  def create
    @round = @competition.rounds.build(params[:round])
    if @round.save
      redirect_to competition_round_path(@competition, @round), notice: "Round created"
    else
      render "new"
    end
  end

  def show
    @round = @competition.rounds.find(params[:id])
  end

  def edit
    @round = @competition.rounds.find(params[:id])
    if @round.open?
      render "edit"
    else
      render "results"
    end
  end

  def results
  end

  def update
    @round = @competition.rounds.find(params[:id])
    if @round.open?
      if @round.update_attributes(params[:round])
        flash[:success] = "Round updated"
        redirect_to @competition
      else
        render "edit"
      end
    end
  end

  private
    def find_competition
      @competition = Competition.find(params[:competition_id])
    end

    def check_owner
      @competition = Competition.find(params[:competition_id])
      redirect_to root_path, alert: "You can't do that!" unless current_user?(@competition.owner)
    end
end
