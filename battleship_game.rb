# Class to represent the Battleship game
class BattleshipGame
    # Initialize the game with a 10x10 grid and set up the ships
    def initialize
      # Set the size of the grid to 10x10
      @grid_size = 10
      
      # Define the ships with their sizes
      @ships = { carrier: 5, battleship: 4, cruiser: 3, submarine: 3, destroyer: 2 }
      
      # Initialize the grid with '~' representing water
      @grid = Array.new(@grid_size) { Array.new(@grid_size, '~') }
      
      # Initialize a grid to track the ship positions
      @ship_positions = Array.new(@grid_size) { Array.new(@grid_size, false) }
      
      # Place the ships on the grid
      place_ships
    end
  
    # Method to place the ships randomly on the grid
    def place_ships
      # Iterate over each ship to place it on the grid
      @ships.each do |name, size|
        loop do
          # Randomly choose the orientation (horizontal or vertical)
          orientation = [:horizontal, :vertical].sample
          
          # Randomly choose the starting position
          row, col = rand(@grid_size), rand(@grid_size)
          
          # Check if the position is valid for placing the ship
          if valid_position?(row, col, size, orientation)
            # Place the ship on the grid
            place_ship(row, col, size, orientation)
            break
          end
        end
      end
    end
  
    # Method to check if the position is valid for placing a ship
    def valid_position?(row, col, size, orientation)
      if orientation == :horizontal
        # Check if the ship goes out of bounds horizontally
        return false if col + size > @grid_size
        
        # Check if the ship overlaps with any other ship horizontally
        (col...col+size).each { |c| return false if @ship_positions[row][c] }
      else
        # Check if the ship goes out of bounds vertically
        return false if row + size > @grid_size
        
        # Check if the ship overlaps with any other ship vertically
        (row...row+size).each { |r| return false if @ship_positions[r][col] }
      end
      true
    end
  
    # Method to place a ship on the grid
    def place_ship(row, col, size, orientation)
      if orientation == :horizontal
        # Place the ship horizontally on the grid
        (col...col+size).each { |c| @ship_positions[row][c] = true }
      else
        # Place the ship vertically on the grid
        (row...row+size).each { |r| @ship_positions[r][col] = true }
      end
    end
  
    # Method to display the current state of the grid
    def display_grid
      # Print the column headers
      puts "  " + (0...@grid_size).to_a.join(" ")
      
      # Print each row of the grid with row numbers
      @grid.each_with_index do |row, i|
        puts "#{i} " + row.join(" ")
      end
    end
  
    # Method to play the game
    def play
      # Get the maximum number of attempts from the user
      max_attempts = get_max_attempts
      
      # Initialize the number of attempts and hits
      attempts = 0
      hits = 0
      
      # Calculate the total number of ship squares
      total_squares = @ships.values.sum
  
      # Main game loop
      while hits < total_squares && attempts < max_attempts
        # Display the current state of the grid
        display_grid
        
        # Prompt the user to enter a row and column
        puts "Enter row and column (e.g., 3 4):"
        input = gets.chomp.split.map(&:to_i)
        
        # Extract the row and column from the input
        row, col = input[0], input[1]
        
        if @ship_positions[row][col]
          # Mark a hit and update the grid
          puts "Hit!"
          @grid[row][col] = 'X'  # 'X' represents a hit
          @ship_positions[row][col] = false  # Mark the position as hit
          hits += 1
        else
          # Mark a miss and update the grid
          puts "Miss!"
          @grid[row][col] = 'O'  # 'O' represents a miss
        end
        
        # Increment the number of attempts
        attempts += 1
        
        # Display the current number of attempts and hits
        puts "Attempts: #{attempts}/#{max_attempts}, Hits: #{hits}/#{total_squares}"
      end
  
      if hits == total_squares
        # Player wins if all ships are sunk
        puts "Congratulations! You've sunk all the ships in #{attempts} attempts."
      else
        # Player loses if maximum attempts are reached
        puts "Game over! You've used all #{max_attempts} attempts."
      end
    end
  
    # Method to get the maximum number of attempts from the user
    def get_max_attempts
      # Initialize the maximum number of attempts
      max_attempts = 0
      
      # Loop until the user enters a valid number of attempts
      while max_attempts < 17 || max_attempts > 99
        # Prompt the user to enter the maximum number of attempts
        puts "Enter the maximum number of attempts (must be between 17 and 99):"
        max_attempts = gets.chomp.to_i
        
        # Display an error message if the number is invalid
        if max_attempts < 17 || max_attempts > 99
          puts "Invalid number of attempts. Please pick another amount."
        end
      end
      max_attempts
    end
  end
  
  # Create a new game instance and start the game
  game = BattleshipGame.new
  game.play