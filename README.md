
# Employee Management System

## Description

The **Employee Management System** is a Flutter app designed to manage employee history and records based on employment duration. It allows users to add, edit, and delete employee data. The app ensures that all employee information is persisted locally using the Hive database and follows a clean architecture with BLoC/Cubit for state management. The app is designed with a pixel-perfect UI, ensuring compatibility across different screen resolutions.

## Features

- **Add, Edit, Delete Employee Data**: The app allows users to manage employee records.
- **Data Persistence**: Uses the Hive database to persist employee data locally.
- **State Management**: BLoC/Cubit architecture to manage the app’s state.
- **Responsive UI**: Pixel-perfect design compatible with all mobile screen resolutions.
- **Date Picker**: Properly styled and functioning date picker as per the design.
  
## Tech Stack

- **Flutter**: Cross-platform mobile development framework.
- **BLoC/Cubit**: State management solution.
- **Hive**: Local database for data persistence.
- **Material UI**: Pre-built Flutter UI components for clean design.
- **Clean Code Architecture**: Structured approach for scalable and maintainable code.

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.0.1
  equatable: ^2.0.3
  intl: ^0.18.1
  flutter_screenutil: ^5.9.3
  google_fonts: ^6.2.1
  flutter_svg: ^2.0.17
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  table_calendar: ^3.2.0
```

## Setup

1. **Clone the repository**:
   ```bash
   git clone <repository_url>
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```
## Flutter WEB
```bash
   https://maulik-emp-management.netlify.app/
```

## Architecture

- **BLoC/Cubit**: Used for managing the state of the app. Events trigger changes in the state, and the UI reacts to state updates.
- **Hive**: Local database used for persistent storage of employee data.
- **Material UI**: The app follows material design principles for its UI elements.
- **Clean Code**: The code structure follows clean coding practices, ensuring readability and maintainability.

## Screenshots

(Add your app screenshots here)

## Contributions

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request
