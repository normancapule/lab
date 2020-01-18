# Specs

Ruby: ruby 2.6.5p114

# Instructions

1. Run the script
    ```
    ruby code_challenge.rb
    ```
2. Command instructions will be given in the command line. STDOUT inputs required.

# Test Data
1.
    ```
    PLACE 0,0,NORTH
    MOVE
    REPORT
    ```
    `Output: 0,1,NORTH`

2.
    ```
    PLACE 0,0,NORTH
    LEFT
    REPORT
    ```
    `Output: 0,0,WEST`

3.
    ```
    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
    ```
    `Output: 3,3,NORTH`
