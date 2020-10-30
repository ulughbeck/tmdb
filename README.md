# TMDB app
A sample Flutter project to showcase Domain Driven Design approach. Project is a simple mobile app that uses [TMDB API](https://developers.themoviedb.org/3/)

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
This application is developed with [Flutter](https://flutter.dev). 
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

Install Flutter on your local machine. View [install instructions](https://flutter.dev/docs/get-started/install)

You also will need to register and get your own TMDB API key and paste it inside `lib/src/core/env/config.dart`
```
// TMDB API token
const apiKey = '[YOUR_API_KEY]';
```

### Installing
Copy project files and install app dependencies by executing the following command in the project folder.
```
flutter packages get
```

### Running
Run the app on emulator or physical device by executing the following command.
```
flutter run
```
*Run the app in release mode for the best performance
```
flutter run --release
```

## Authors
* **Ulugbek Isroilov** - *Author* - [Email](mailto:inulugbek@gmail.com)
