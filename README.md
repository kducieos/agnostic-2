Memory Game – Course Project
1. Project Overview

This project implements a mobile-friendly memory matching game using Flutter and the Flame game engine. The objective of the game is to test the player’s ability to remember the positions of cards and match all pairs within the shortest possible time. The game is structured into multiple screens and provides persistent level progression.

The game has been designed to run responsively across screen sizes and can be operated entirely without keyboard or mouse input.

2. Features and Requirements
2.1 Multi-Screen Structure

The application contains the required screens:

Start Screen – Entry point with a game introduction and navigation to level selection.

Level Selection Screen – Displays available levels and highlights completed ones.

Game Screen – Hosts the Flame-powered game logic and memory matching mechanics.

Result Screen – Shows completion time and allows the player to return to level selection.

Navigation between these screens follows an intuitive and consistent design.

2.2 Responsive Layout

The user interface adjusts according to screen size using Flutter layout widgets and breakpoints.

The game engine uses Flame’s CameraComponent.withFixedResolution to ensure consistent in-game component sizing regardless of device resolution.

A maximum content width is applied on large desktop screens to maintain readability.

2.3 Levels and Progression

The game includes three levels, each differing in grid size and difficulty.

Completion status is persisted between sessions using SharedPreferences.

A completed level is marked as “unlocked,” allowing the player to continue from the next stage after restarting the app.

2.4 Game Interaction

The game is fully playable through tapping; no keyboard or mouse is required.

Cards flip upon tapping, and matched pairs remain visible.

The game measures the time required to complete each level.

2.5 Technology Stack

Flutter as the UI framework.

Flame as the game engine.

SharedPreferences for local data persistence.

3. Running the Application
3.1 Requirements

Flutter SDK 3.0 or later

A device or emulator capable of running Flutter apps

3.2 Running the Game Locally

Clone the repository:

git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>


Fetch dependencies:

flutter pub get


Run the game:

flutter run


The game will launch on the connected device or emulator.

4. Project Structure
lib/
  main.dart
  screens/
    start_screen.dart
    level_select_screen.dart
    game_screen.dart
    result_screen.dart
  game/
    memory_game.dart
    card_component.dart
  services/
    progress_service.dart
  config/
    level_config.dart


Assets (images) are excluded from the version submitted to the course grader, as required.

5. Deployment Status

The project is designed to support Web deployment using Flutter’s build web target.
For the purposes of this submission, only the local version is required and provided.
The source code in this repository fully compiles and runs as a Flutter project without additional configuration.

6. Usage

Select a level from the level selection screen.

Tap cards to flip them and attempt to match pairs.

Complete all pairs to finish the level.

The completion time will be recorded and shown on the result screen.

Completed levels unlock the next stage.

7. License

This project is submitted as coursework. Redistribution should follow institutional guidelines.
