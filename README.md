# MATLAB Snake Game Project Summary
Title: Snake Game Development Using MATLAB

Objective:
Design and implement a classic snake game in MATLAB, showcasing skills in image processing, GUI design, and real-time control.

Project Overview:
This project involves creating a snake game where the snake's movement and growth are controlled by the player. The game includes features like keyboard and button controls, score tracking, speed variation, and a game-over condition when the snake collides with itself.

Key Features:

Game Start: The game starts on pressing any key.
Snake Movement: Controlled using both keyboard and GUI buttons.
Score and Growth: The snake's length and score increase upon eating randomly generated targets.
Pause and Resume: Game pauses when "Enter" or "Pause" is pressed and resumes with any key press.
Speed Variation: The snake's speed increases with higher scores.
Game Over: The game stops when the snake bites itself.
Design Breakdown:

Creating Images:

Generated grayscale and RGB images using MATLAB’s image processing toolbox.
Implemented image refresh to simulate snake movement.
Creating Snake:

Defined the snake's position using matrices.
Updated pixel values to display the snake in the game window.
Moving Snake:

Implemented movement logic to update the snake’s position based on direction inputs.
Handled boundary conditions to ensure continuous movement within the game area.
Controlling Snake:

Configured GUI push buttons and keyboard inputs for directional control.
Added conditions to prevent the snake from reversing directly into itself.
Generating Target:

Used random number generation to place targets at random positions within the game area.
Ensured targets do not overlap with the snake's current position.
Increasing Snake Length:

Implemented logic to increase snake length and update score upon eating a target.
Displayed updated score in the GUI.
Game Over Condition:

Detected self-collision of the snake.
Displayed a game-over message and stopped the game upon collision.
Pause and Speed Control:

Added functionality to pause and resume the game.
Adjusted snake speed based on the score to increase game difficulty.
Tools and Technologies:

MATLAB
Image Processing Toolbox
GUI Design and Control


Application:
The project is a great addition to the resume, highlighting skills in MATLAB, GUI development, and problem-solving in game design.

