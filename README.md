# shopy

A new Flutter project.


 ## Overview
 This Flutter application displays products from an external API, enables dummy login and dummy signup, and provides
 full cart functionality using a Firebase Firestore database. Users can add products to a cart, adjust product
 quantities, remove products from cart, and mark/unmark products as favorites.

 ## Prerequisites
 Ensure the following dependencies are installed before setting up the project:- Flutter SDK (latest stable version)- Dart (included with Flutter)- Android Studio / Xcode (for Android/iOS development)- A physical device or emulator
 
 ## Setup Instructions
 ### Clone the Repository
 git clone https://github.com/your-repo-name.git

 ### Install Dependencies

 flutter pub get

 ### Run the Application

 #### Android
 flutter run -d android

 #### iOS
 flutter run -d ios

 #### Web

 flutter run -d chrome

## Assumptions- The app uses dummy login credentials and does not validate against a remote server.- Uses SQLite for storing cart and favorite products locally.- Uses Provider, BLoC, or Riverpod for state management.- Uses the endpoint https://dummyjson.com/products to fetch products.- API integration includes handling loading and error states.
 ## Features

 1. **Authentication (Dummy Login)** 
 - Simple login screen with username and password validation.- Navigates to the home screen upon successful login.

 2. **Products Display & API Integration**
 - Fetches products from [https://fakestoreapi.com/products].- Displays title, price, description, and a thumbnail image.- Shows loading and error states.

 3. **Cart Functionality Using Firebase Firestore**
 - Add products to the cart and store them in a local database.- Manage cart with:- Cart count badge- Quantity adjustments- Removing items- Updates the UI in real-time.

 4. **Favorites Option**
 - Users can mark/unmark products as favorites.- Saves favorite products in Firebase Firestore.- provides a separate view for favorites.

5. **General App Navigation & UI**
- Home Screen -> Cart Screen -> Favorites Screen- Responsive UI with best UI/UX practices.- Provides user feedback using toast/snackbar messages.

 6. **Firebase Firestore Local Database**
 - Stores cart items and favorite products locally.- Ensures data consistency during add, update, and remove operations.

 ## Suggested Packages- 
 **State Management:**
   BLoC,
   **HTTP Requests:** http  **Image Loading:** cached_network_image (optional)- **Local Database:** sqflite


 flutter clean

 flutter pub get- If the app crashes on iOS, ensure you have run:
 
 cd ios && pod install && cd ..

 ## Submission- Provide the complete Flutter project source code.- Include this README.md with setup instructions and assumptions.- Ensure the project compiles without errors and that all functionalities work as specified.
