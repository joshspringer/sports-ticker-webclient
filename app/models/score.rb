class Score
  attr_accessor :id, :home_team, :home_team_score, :away_team, :away_team_score, :date, :winner
  def initialize(input_options)
    @id = input_options['id']
    @home_team = input_options['home_team']
    @home_team_score = input_options['home_team_score']
    @away_team = input_options['away_team']
    @away_team_score = input_options['away_team_score']
    @date = input_options['date']
    @winner = input_options['winner']
  end

  def self.find(id)
    score = Unirest.get("#{ENV['API_BASE_URL']}/scores/#{id}").body
    # created a Score class with attr_ methods
    @score = Score.new(score)
  end

  # def self.all
  #   scores = Unirest.get("#{ENV['API_BASE_URL']}/scores").body
  #   @scores = Score.all
  # end
end
