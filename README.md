# GifSearcher – Flutter App

GifSearcher is a simple Flutter mobile application that allows users to search for and view animated GIF images using the Giphy API. The app supports real-time search, debounced input handling, and infinite scrolling.

## Features

- Real-time keyword search with debounce
- Automatic loading of more GIFs (infinite scroll)
- Image retrieval from the Giphy API
- Simple and responsive Flutter interface

## Installation

### 1. Clone the repository

git clone https://github.com/MViksna03/GifSearcher.git
cd GifSearcher
### 2. Install dependencies
flutter pub get
### 3. Configure your Giphy API key
Create a file named lib/config.dart with the following content:

class Config {
  static const String apiKey = 'YOUR_GIPHY_API_KEY';
}

Or copy from the provided example file:

cp lib/config.dart.example lib/config.dart
You must obtain your own Giphy API key from https://developers.giphy.com/.

### 4. Run the application

flutter run

The app has been tested using an Android emulator. You can use either an Android emulator (e.g., from Android Studio like I did) or a physical device connected via USB.
### Project Structure
lib/

├── main.dart              # UI and search logic

├── gif_search_service.dart # Handles API requests to Giphy

├── config.dart.example    # Example config file for API key
