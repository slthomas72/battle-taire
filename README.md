
# BattleTaire (Battleship Game)

## Introduction

Welcome to BattleTaire! This is a command-line version of the classic Battleship game, implemented in Ruby. The objective is to sink all the ships placed on a 10x10 grid by making guesses.

## Prerequisites

To run the game, you need to have Ruby installed on your system. You can check if Ruby is installed by running the following command in your terminal:

```bash
ruby -v
```

If Ruby is not installed, you can download and install it from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/).

## Getting Started

### Step 1: Download the Game Code

Clone the repository or download the game code to your local machine.

### Step 2: Navigate to the Game Directory

Open your terminal and navigate to the directory where you have saved the game code.

```bash
cd path/to/your/directory
```

### Step 3: Run the Game

To start the game, run the following command:

```bash
ruby battleship_game.rb
```

### Step 4: Enter the Maximum Number of Tries

When the game starts, you will be prompted to enter the maximum number of tries. The number of tries must be between 17 and 100. This is because you need at least 17 tries to potentially hit all the ship squares, and the grid size is 10x10, making 100 the upper limit.

```plaintext
Enter the maximum number of attempts (must be between 17 and 99):
```

Enter a valid number and press `Enter`.

### Step 5: Play the Game

Once you have entered the maximum number of tries, the game will display the 10x10 grid. You will be prompted to enter the row and column number for each guess. The grid uses numbers for both rows and columns.

For example:

```plaintext
Enter row and column (e.g., 3 4):
```

Enter your guess in the format `row column` and press `Enter`.

### Game Output

- If you hit a ship, the game will display "Hit!" and mark the grid with an `X`.
- If you miss, the game will display "Miss!" and mark the grid with an `O`.
- The game will show the number of attempts made and the number of hits after each guess.

### Winning or Losing

- You win the game if you hit all the ship squares within the maximum number of tries.
- You lose the game if you run out of tries before sinking all the ships.

At the end of the game, a message will be displayed indicating whether you won or lost.

```plaintext
Congratulations! You've sunk all the ships in X attempts.
```

or

```plaintext
Game over! You've used all X attempts.
```

## Example Gameplay

```plaintext
Welcome to BattleTaire!
Enter the maximum number of attempts (must be between 17 and 99):
25
  0 1 2 3 4 5 6 7 8 9
0 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
1 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
2 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
3 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
4 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
5 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
6 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
7 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
8 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
9 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
Enter row and column (e.g., 3 4):
3 4
Miss!
Attempts: 1/25, Hits: 0/17
...
```

Enjoy playing BattleTaire!
