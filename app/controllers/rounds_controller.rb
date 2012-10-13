class RoundsController < ApplicationController
  before_filter :find_competition, only: [:new, :create, :show, :edit, :update]
  before_filter :check_owner, only: [:new, :create, :edit, :update, :results, :close_early]
  before_filter :find_round, only: [:close_early, :results, :tips, :enter_tips]

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
      @matches = @round.matches
      render "results"
    end
  end

  def results
    unless params[:match].nil?
      params[:match].each do |match_id, outcome|
        match = Match.find(match_id)
        result = match.build_result(winner: outcome)
        result.save or render :text => result.inspect
      end
      @round.results_entered = true
      @round.save
    end
    render "show"
  end

  def tips
    unless params[:match].nil?
      tips = []
      params[:match].each do |match_id, probability|
        match = Match.find(match_id)
        existing_tip = match.tip_of_user(current_user)
        if existing_tip.nil?
          tip = match.tips.build(user_id: current_user.id, probability: probability)
        else
          tip = existing_tip
          tip.probability = probability
        end

        tips << tip
        unless tip.valid?
          flash[:success] = "There was an error with your tips."
          redirect_to competition_round_enter_tips_path(@competition, @round) and return
        end
      end
      tips.each do |tip|
        tip.save
      end
    end
    render "show"
  end

  def enter_tips
  end

  def close_early
    @round.closing_date = Date.yesterday
    @round.save
    redirect_to [@competition, @round], notice: "Round closed early."
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

    def find_round
      @competition = Competition.find(params[:competition_id])
      @round = @competition.rounds.find(params[:round_id])
    end
end
