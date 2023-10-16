<!-- ABOUT THE PROJECT -->

# HangMan

[![Product-Text](assets/readme/product-screencast.gif)](assets/readme/product-screencast.gif) <!-- TODO: link to app release apk file, github -->

Hangman is a classic word-guessing game where players attempt to uncover a hidden word by suggesting
letters one at a time. Each incorrect guess results in a step towards completing a hangman figure.
The challenge lies in guessing the word before the hangman is fully drawn.

# Features

- Admin app controlled. <!-- TODO: link to admin app repo-->
- Applied backend for maintaining score.
- Win + Lose animation.
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
[app releases section](null.com)<!-- TODO: link to app releases-->. Additionally, you'll need to
download the admin application
from [this link](null.com)<!-- TODO: link to admin app, app releases -->.
Distribute the user app to all the participants who will be playing the game, while the game's
control is managed through the admin app.

<span style="color:#ff4f4f">
Note: The Firebase configuration applied in this application allows universal read and write access.
When using the provided APK files directly, be aware that others might also be utilizing the
user/admin app, potentially affecting score and question access managed by the admin application.
</span>

For a more controlled deployment, it's recommended to clone
the [repository](null.com)<!-- TODO: link to clone repository section -->. Make sure to remove the
existing `android/app/google-services.json` file and replace it with the appropriate configuration
file from your Firebase console/project.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel
free to [open an issue](null.com) or [create a pull request](null.com)
<!--TODO: link to open issue and create pull request -->

# Acknowledgements

flutter libraries used from [pub.dev](pub.dev)\
[cupertino_icons](null.com)\
[firebase_core](null.com)\
[google_fonts](null.com)\
[flutter_spinkit](null.com)\
[cloud_firestore](null.com)\
[rive](null.com)\
[percent_indicator](null.com)
<!-- TODO: link to pub dev-->