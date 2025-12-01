Memory Game – Course Project
1. Project Overview

This project implements a memory-matching game using Flutter and the Flame game engine.
The objective of the game is to match all pairs of cards by recalling their positions as efficiently as possible.
The design emphasizes responsive layout, clear navigation, and mobile-friendly interaction.

The application is structured around multiple screens and preserves user progression between sessions.

2. Features and Requirements
2.1 Multi-Screen Structure

The game includes all required views:

Start Screen – Introduction and navigation entry point.

Level Selection Screen – Displays three levels and indicates which ones are completed.

Game Screen – Runs the Flame-based game where cards flip, match detection occurs, and timing is measured.

Result Screen – Shows the player’s completion time and the option to continue or return.

Navigation flows intuitively and consistently across screens.

2.2 Responsive Layout

UI adapts to different screen sizes using Flutter layout widgets and breakpoints.

The game itself uses CameraComponent.withFixedResolution in Flame to ensure stable component scaling on all devices.

A maximum content width is applied on large displays to maintain usability.

2.3 Levels and Progression

The game includes three levels, each with increasing grid size and difficulty.

Level completion is stored using SharedPreferences.

Completed levels remain unlocked after restarting the application.

2.4 Interaction Model

The game is fully playable via tap input; no keyboard or mouse is required.

Card flipping, pair matching, and timing systems are implemented within Flame.

The elapsed time is displayed upon level completion.

2.5 Technology Stack

Flutter – UI and application structure

Flame – Game engine

SharedPreferences – Local persistence of level progression

3. Running the Application
3.1 Requirements

Flutter SDK 3.0 or later

A physical device or emulator capable of running Flutter applications

3.2 Running Locally

Clone the repository:

git clone https://github.com/kducieos/agnostic-2.git
cd agnostic-2


Install dependencies:

flutter pub get


Run the game:

flutter run


The application will launch on the connected device or emulator.

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

pubspec.yaml
README.md
analysis_options.yaml (optional)


Asset files (images) are intentionally excluded from the submission ZIP, as required.

5. Deployment Status

The application implements a structure that supports Web deployment via Flutter's build web target.
However, in accordance with the course instructions, the submitted project focuses solely on the local build.
Therefore:

No deployed URL is provided for this submission.
The source code provided in this repository compiles and runs locally without any further configuration.

6. Usage Instructions

Launch the application.

Select a level from the level selection screen.

Tap cards to flip and attempt to match pairs.

Complete all matches to finish the level.

The completion time is displayed on the result screen.

Progress is saved automatically, and completed levels unlock subsequent stages.

7. License

This project is submitted as coursework.
Any redistribution or reuse should follow institutional policies and academic guidelines.
