class Cli

  def run
    puts "Hello and welcome to the Amazing Starwars API (that was built in an hour)!"

    puts "Please hold while we explore the galaxy for information..."
    API.get_starships
    puts "Thank you for your patience, we now have your information."
    print_main_menu
  end

  def print_main_menu
    puts "Press 1 to list out starships"
    puts "Type 'exit' to exit program"
    main_menu
  end

  def main_menu
    user_input = gets.strip

    if user_input == "1"
      print_starships
      print_main_menu
    elsif user_input == "exit"
      goodbye
      exit
    else
      invalid_input
      print_main_menu
    end
  end

  def print_starships
    puts ""
    puts "----------------"
    Starship.all.each.with_index(1) do |starship, index|
      puts ""
      puts "Starship #{index}."
      puts "Starship: #{starship.name}"
    end
  end

  def goodbye
    puts "Now leaving the starwars universe. May the force be with you!"
  end

  def invalid_input
    puts "Invalid command, please try again!"
  end
end