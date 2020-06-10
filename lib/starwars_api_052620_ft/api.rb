class API
  BASE_URL = "https://swapi.dev/api/"

  def self.get_starships(next_page=nil)
    response = nil
    if next_page
      response = RestClient.get(next_page)
    else 
      response = RestClient.get(BASE_URL + "starships/")
    end
    data = JSON.parse(response)
    
    data["results"].each do |starship_data|
      name = starship_data["name"]
      cost_in_credits = starship_data["cost_in_credits"]
      passengers = starship_data["passengers"]
      crew = starship_data["crew"]
      hyperdrive_rating = starship_data["hyperdrive_rating"]
      starship_class = starship_data["starship_class"]
      Starship.new(
        name: name,
        cost_in_credits: cost_in_credits,
        passengers: passengers,
        crew: crew,
        hyperdrive_rating: hyperdrive_rating,
        starship_class: starship_class
      )
    end
    
    if data["next"]
      self.get_starships(data["next"])
    end
    
  end

  def self.get_characters

  end
end