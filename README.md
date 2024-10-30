# **Veterinary App**
> *A Flutter application for managing animal records in a veterinary context, leveraging Firebase for authentication and data storage.*

## **Introduction**
The Veterinary App is a Flutter-based application designed to simplify the management of animal records for veterinary professionals. It provides features for user authentication, record creation, and detailed record views, all backed by Firebase to ensure secure, real-time data handling across different platforms.

## **Project Description**
- **Main functionality:** 
  - User registration and login via Firebase Authentication.
  - Adding, viewing, and managing animal records stored in Firebase Firestore.
  - Displaying detailed information about each animal, including images and general data.
- **Technologies used:** 
  - **Flutter** for UI and cross-platform functionality.
  - **Firebase Authentication** for user login and registration.
  - **Firebase Firestore** for data storage and real-time updates.
- **Challenges faced:** Ensuring compatibility across Android, iOS, and web platforms, with efficient Firebase configuration for each.
- **Future improvements:** Adding support for advanced analytics and integration with external veterinary data sources.

## **Table of Contents**
1. [Introduction](#introduction)
2. [Project Description](#project-description)
3. [Installation](#installation)
4. [Usage](#usage)
5. [License](#license)

## **Installation**

1. **Prerequisites**:
   - **Flutter SDK** - [Installation guide](https://flutter.dev/docs/get-started/install)
   - **Firebase CLI** - [Installation guide](https://firebase.google.com/docs/cli)
  
2. **Clone the repository:**
   ```bash
   git clone https://github.com/ivmg5/veterinary_app.git
   cd veterinary_app
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Configure Firebase:**
   - Ensure `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) are added to the respective directories.
   - Configure Firebase options for web, Android, and iOS in `lib/firebase_options.dart`.

5. **Run the project:**
   ```bash
   flutter run
   ```

### **Configuration Options**
   - Use `DEBUG=true` for verbose logging during development.
   - Set environment variables like `API_URL` if integrating additional services.

## **Usage**
To use the app, follow these steps:
1. Register or log in through the Firebase Authentication-powered login screen.
2. Navigate to the main menu to view or add animal records.
3. View animal details by selecting a record to see attributes like name, age, and an image.
   
**Example usage:**
```dart
// Example to add a new animal
Navigator.pushNamed(context, '/newAnimal');
```

## **License**
This project is licensed under the MIT License.

[![Build Status](https://img.shields.io/badge/status-active-brightgreen)](#)
[![Code Coverage](https://img.shields.io/badge/coverage-80%25-yellowgreen)](#)
