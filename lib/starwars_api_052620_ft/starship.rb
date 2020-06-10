class Starship
  attr_accessor :name, :cost_in_credits, :passengers, :crew, :hyperdrive_rating, :starship_class

  @@all = []

  def initialize(name:, cost_in_credits:, passengers:, crew:, hyperdrive_rating:, starship_class:)
    self.name = name
    self.cost_in_credits = cost_in_credits
    self.passengers = passengers
    self.crew = crew
    self.hyperdrive_rating = hyperdrive_rating
    self.starship_class = starship_class

    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end