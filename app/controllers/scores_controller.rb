class ScoresController < ApplicationController
  def index
    @scores = Unirest.get("#{ENV['API_BASE_URL']}/scores").body
    render 'index.html.erb'
  end

  def show
    # created a Score class with attr_ methods
    # score = Unirest.get("#{ENV['API_BASE_URL']}/scores/#{params[:id]}").body
    # @score = Score.new(score)

    # created a find method that makes Unirest call using params id
    @score = Score.find(params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    score = Unirest.post("#{ENV['API_BASE_URL']}/scores",
      headers: { 'Accept' => 'application/json' },
      parameters: {
        home_team: params[:home_team],
        home_team_score: params[:home_team_score],
        away_team: params[:away_team],
        away_team_score: params[:away_team_score]
      }).body
    redirect_to "/scores/#{score['id']}"
  end

  def edit
    @score = Score.find(params[:id])
    render 'edit.html.erb'
  end

  def update
    @score = Unirest.patch("#{ENV['API_BASE_URL']}/scores/#{params[:id]}",
      headers: { 'Accept' => 'application/json' },
      parameters: {
        home_team: params[:home_team],
        home_team_score: params[:home_team_score],
        away_team: params[:away_team],
        away_team_score: params[:away_team_score]
      }).body
    redirect_to "/scores/#{@score['id']}"
  end

  def destroy
    Unirest.delete("#{ENV['API_BASE_URL']}/scores/#{params[:id]}")
    redirect_to '/scores'
  end
end
