# 🎯 Goals App — Guess My Number

A fun **number guessing game** built with **Flutter**. Pick a number between 1 and 99, and let the phone's opponent try to guess it! Guide the opponent with "Higher" or "Lower" hints until it finds your number.

## ✨ Features

- 🎮 **Interactive Gameplay** — Pick a number and guide the opponent to guess it
- 🧠 **Binary Search Logic** — The opponent uses a smart algorithm to narrow down guesses
- 📋 **Guess Log** — Scrollable list tracking every guess with round numbers
- 🎨 **Beautiful UI** — Gradient background, custom fonts, and polished design
- 🔄 **Replay** — Start a new game anytime from the Game Over screen
- ✅ **Input Validation** — Alerts for invalid numbers and dishonest hints

## 🎮 How It Works

1. **Start Screen** — Enter a number between 1 and 99
2. **Game Screen** — The opponent makes a guess. Tell it if your number is **higher (+)** or **lower (−)**
3. **Game Over** — Once the opponent guesses correctly, see how many rounds it took
4. **Play Again** — Hit "Start New Game" to go again!

## 🏗️ Project Structure

```
lib/
├── main.dart                         # App entry point, navigation & gradient background
├── constants/
│   └── colors.dart                   # App color palette
├── screens/
│   ├── start_game_screen.dart        # Number input screen
│   ├── game_screen.dart              # Guessing gameplay screen
│   └── game_over_screen.dart         # Results & restart screen
└── widgets/
    ├── game/
    │   ├── number_container.dart      # Displays current guess
    │   └── guess_log_item.dart        # Individual guess log entry
    └── ui/
        ├── primary_button.dart        # Reusable action button
        ├── title_text.dart            # Bordered title text
        ├── card_widget.dart           # Dark card container
        └── instruction_text.dart      # Yellow instruction label
```

## 🛠️ Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Fonts:** OpenSans (Regular & Bold)
- **Design:** Linear gradient background, custom color palette, Material Design 3

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- Android Studio / VS Code with Flutter extension
- An emulator or physical device

### Run the App

```bash
# Clone the repository
git clone https://github.com/yashrajputs/Goals-App.git

# Navigate to the project
cd Goals-App

# Get dependencies
flutter pub get

# Run the app
flutter run
```

## 🎨 Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Primary 500 | `#72063C` | Buttons, highlights |
| Primary 600 | `#640233` | Button press states |
| Primary 700 | `#4E0329` | Gradient start |
| Primary 800 | `#3B021F` | Card backgrounds |
| Accent 500 | `#DDB52F` | Text accents, borders, gradient end |

## 📄 License

This project is open source and available for learning purposes.

