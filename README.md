# HangMan

[![Product-Text](assets/readme/product-screencast.gif)](https://github.com/DILPREET1910/hangman/releases)

Hangman is a classic word-guessing game where players attempt to uncover a hidden word by suggesting
letters one at a time. Each incorrect guess results in a step towards completing a hangman figure.
The challenge lies in guessing the word before the hangman is fully drawn.

# Features

- [Admin app controlled](https://github.com/DILPREET1910/hangman-admin)
- Applied backend for maintaining score
- Win + Lose animation
- Leader Board

# Getting Started

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Firebase](https://firebase.google.com/)

## Clone Repository

```shell
cd project_directory
git clone https://github.com/DILPREET1910/hangman
```

## Customisation

In this Flutter project, all code related to the UI and Firebase backend is organised under
the `lib/` directory. Each file within this directory is meticulously commented and named according
to its specific use case. This structured approach ensures that understanding the functionality of
each part of the codebase is straightforward.

If you wish to add/remove the pre hardcoded questions, you should consider making changes to
the `List<Widget> questions` list located at `lib/globalVariable.dart`. You would also have to
change `answers` and `answerGuessed` in order to make sure each question corresponds to its correct
answer.

## Usage

If you prefer to use the application in its current state, you can find the user application in the
[app releases section](https://github.com/DILPREET1910/hangman/releases). Additionally, you'll need
to
download the admin application
from [this link](https://github.com/DILPREET1910/hangman-admin/releases).
Distribute the user app to all the participants who will be playing the game, while the game's
control is managed through the admin app.

<span style="color:#ff4f4f">
Note: The Firebase configuration applied in this application allows universal read and write access.
When using the provided APK files directly, be aware that others might also be utilizing the
user/admin app, potentially affecting score and question access managed by the admin application.
</span>

For a more controlled deployment, it's recommended to clone
the [repository](https://github.com/DILPREET1910/hangman#clone-repository). Make sure to remove the
existing `android/app/google-services.json` file and replace it with the appropriate configuration
file from your Firebase console/project.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel
free to [open an issue](https://github.com/DILPREET1910/hangman/issues)
or [create a pull request](https://github.com/DILPREET1910/hangman/pulls)

# Acknowledgements

flutter libraries used from [pub.dev](pub.dev)\
[cupertino_icons](https://pub.dev/packages/cupertino_icons)\
[firebase_core](https://pub.dev/packages/firebase_core)\
[google_fonts](https://pub.dev/packages/google_fonts)\
[flutter_spinkit](https://pub.dev/packages/flutter_spinkit)\
[cloud_firestore](https://pub.dev/packages/cloud_firestore)\
[rive](https://pub.dev/packages/rive)\
[percent_indicator](https://pub.dev/packages/percent_indicator)