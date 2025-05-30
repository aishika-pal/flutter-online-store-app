# Flutter Fullstack Application

This is a full-stack Flutter application designed for both web and mobile platforms (iOS and Android). The application showcases a point of sale system where users can browse products, manage their cart, and handle user authentication.

## Features

- Displays products fetched from an external API.
- User authentication with dummy signup and login functionality.
- Full cart functionality using Firebase Firestore.
- Users can:
  - Add products to their cart.
  - Adjust product quantities in the cart.
  - Remove products from the cart.
  - Mark and unmark products as favorites.

## Project Structure

```
flutter_fullstack_app
├── lib
│   ├── main.dart                # Entry point of the application
│   ├── models
│   │   └── product.dart         # Product model
│   ├── screens
│   │   ├── home_screen.dart     # Home screen displaying products
│   │   ├── login_screen.dart     # User login screen
│   │   ├── signup_screen.dart    # User signup screen
│   │   ├── cart_screen.dart      # Cart management screen
│   │   └── favorites_screen.dart  # Favorites management screen
│   ├── services
│   │   ├── api_service.dart      # Service for API calls
│   │   ├── auth_service.dart     # Service for authentication
│   │   └── firestore_service.dart # Service for Firestore interactions
│   ├── widgets
│   │   ├── product_tile.dart     # Widget for displaying product info
│   │   ├── cart_item.dart        # Widget for displaying cart items
│   │   └── favorite_item.dart    # Widget for displaying favorite items
│   └── utils
│       └── constants.dart        # Constants used throughout the app
├── pubspec.yaml                  # Flutter configuration file
├── android                       # Android-specific code
├── ios                           # iOS-specific code
└── web                           # Web-specific code
```

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```
   cd flutter_fullstack_app
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Configure Firebase:
   - Set up a Firebase project and Firestore database.
   - Add your Firebase configuration to the project.

5. Run the application:
   ```
   flutter run
   ```

## Usage Guidelines

- Users can sign up and log in using dummy credentials.
- Browse products on the home screen and manage the cart from the cart screen.
- Mark products as favorites for easy access later.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any suggestions or improvements.#   f l u t t e r - p r o j e c t - o n l i n e - s t o r e  
 #   f l u t t e r - p r o j e c t - o n l i n e - s t o r e  
 