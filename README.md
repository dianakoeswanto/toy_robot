# Toy Robot

## Description

This is a command line application that that simulates a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

The available commands are:
```plain
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
MOVE
REPORT
```

- PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application will discard all commands in the sequence until a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- REPORT will announce the X,Y and orientation of the robot.
- A robot that is not on the table will ignore the MOVE, LEFT, RIGHT and REPORT commands.
- EXIT to quit the system
- Input is from a command line


## Prerequisites

Ruby 3.3.4

## Setup

1. Clone this repo<br />`git clone git@github.com:dianakoeswanto/toy_robot.git`<br /><br />
2. Change to the app directory<br />`cd toy_robot`<br /><br />
3. Install dependencies<br />`bundle install`

## Running the app

`ruby lib/main.rb`

A few test inputs and expected outputs have been provided under `test_data/test1.txt`. Feel free to use them by copying and pasting them on the command line.

Enter `EXIT` to quit the application.

## Running the test

`bundle exec rspec`
