# Whiteboarding Plan

## What language should I write the Battleship Game in? 
I decided to write the Battleship game in Ruby because it keeps things simple and lets me work fast, which is perfect since I only have about 45 minutes to get it up and running. Ruby’s syntax is super clean and easy to work with, so I can focus on making the game fun rather than wrestling with the language. Plus, doing a two-player version would just take way more time and effort, which isn’t practical right now.

This version of the game is meant for one person to play against the computer. It’s just easier and more fun this way, especially for a quick command-line game. Trying to make it work for two players on the command line would be a headache, with all the extra work handling inputs and keeping track of the game state for both players.

I could have gone with Python, but I think plain Ruby is a better fit for this project. It’s straightforward, and there’s no need for any heavy frameworks like Rails since it’s just a simple command-line game. Ruby lets me dive right into the game logic without getting bogged down by extra setup, making it the best choice for this quick project.

## Step 1: High-Level Overview
**Objective**: Describe the overall purpose of the code.
**Example**:# BattleTaire (Battleship Game)

1. This class implements a Battleship game in Ruby, where the player tries to sink ships placed on a 10x10 grid by making guesses."

2. This is a single-player version where you play against the app. The app places the 5 ships randomly across the board.

3. You have 5 ships in the game with the following sizes: 2, 3, 3, 4, 5.

4. A total of 17 squares laid vertically or horizontally. The tricky part here is having the app randomly place these with the correct number of rows or columns for each type of ship. You possibly could run into a long-running loop since it randomly picks positions where a ship already resides, so you just can't lay out the rest of the ship on the incrementing squares based on one random square pick for the ship.

5. The user will enter the amount of tries they get to pick a row and column number.

6. We will not use the alphabet on the columns; just numbers for the columns and the rows. The grid is 10x10, allowing for a maximum of 100 tries.

7. At the start of the game, the user will input the number of tries they have to play the game. If they run out of tries, the user essentially loses if they have not pegged all of the ships by then!

8. The `@tries` input will not allow 17 or less for `@tries` input (since you have to at least have 17 tries, which is the total number of ship squares) and not more than 100 tries.

9. Since this is a solitary game, I wish to call this game BattleTaire!!! (like Battleship/Solitaire card game).


## Step 2: Initialize the Game

Call the class `BattleShip`.

In Ruby, instance variables are prefixed with an `@` symbol. They are used to store data that is unique to each object created from a class.
**Objective**: Explain the initialization process. (this will be a method)
- `@grid_size`: Define the size of the grid.
- `@ships`: Define the ships and their sizes.
- `@grid`: Initialize the grid with water ('~').
- `@ship_positions`: Initialize a grid to track ship positions.
- `place_ships`: Call the method to place ships randomly on the grid. (this will be a method)

## Step 3: Placing Ships Method
**Objective**: Describe how ships are placed on the grid.
- `place_ships`: Iterate over each ship and place it on the grid.
  - Randomly choose orientation and starting position.
  - Validate the position using `valid_position?`. (this will be a method)
  - Place the ship using `place_ship`. (this will be a method)

**Method**: `valid_position?`
- Check if the ship fits within the grid and does not overlap with other ships.
- Use loops to check horizontally or vertically based on the orientation.

**Method**: `place_ship`
- Place the ship on the grid by updating the `@ship_positions` array.

## Step 4: Displaying the Grid
**Objective**: Explain how the grid is displayed.
- `display_grid`: Print the grid with row and column headers. (this will be method)

## Step 5: Playing the Game
**Objective**: Describe the gameplay loop.
- `play`: Main method to play the game. (this will be method)
  - Get maximum attempts from the user.
  - Initialize attempts and hits counters.
  - Loop until all ships are sunk or maximum attempts are reached.
  - Display the grid and prompt the user for a guess.
  - Check if the guess is a hit or miss, update the grid, and increment counters.
  - Display game status after each attempt.

## Step 6: User Input
**Objective**: Explain how user input is handled. (this will be a method)
- `get_max_attempts`: Get the maximum number of attempts from the user, ensuring the input is valid.

## Step 7: Ending the Game
**Objective**: Explain the end conditions of the game.
- Check if the player has sunk all ships or reached the maximum number of attempts.
- Display a congratulatory message if the player wins or a game over message if they lose.

## Whiteboard Breakdown

**Initialize the Game**
- `@grid_size = 10`
- `@ships = { carrier: 5, battleship: 4, cruiser: 3, submarine: 3, destroyer: 2 }`
- `@grid = Array.new(@grid_size) { Array.new(@grid_size, '~') }`
- `@ship_positions = Array.new(@grid_size) { Array.new(@grid_size, false) }`
- `place_ships`

**Placing Ships**
- Randomly choose orientation and starting position.
- Validate position with `valid_position?`.
- Place ship with `place_ship`.

**Display Grid**
- Print the grid with row and column headers.

**Play Method**
- Get maximum attempts.
- Initialize counters.
- Loop for guesses.
- Update grid based on guesses.
- Display attempts and hits.

**User Input and Validation**
- Get and validate maximum attempts.

**End Game Conditions**
- Check if all ships are sunk or maximum attempts are reached.
- Display the appropriate message.
