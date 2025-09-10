# Flutter Base BLoC Project

A professional Flutter application template built with **BLoC (Business Logic Component)** state management, featuring a clean architecture, dark/light theme support, and comprehensive project structure.

## 🚀 Project Overview

This project serves as a **production-ready Flutter template** that demonstrates best practices in:
- **BLoC State Management** - Clean separation of business logic
- **Clean Architecture** - Well-organized folder structure
- **Theme Management** - Dynamic light/dark theme switching
- **API Integration** - RESTful API communication with Dio
- **Local Storage** - SharedPreferences for data persistence
- **Error Handling** - Comprehensive error management
- **String Management** - Centralized string constants
- **Performance Optimizations** - Cached calculations and background operations
- **Cached Operations**: Background thread operations to prevent main thread blocking
- **Performance Optimized**: Debounced connection checks to prevent frame skipping
- **Asynchronous UI Updates**: Non-blocking UI operations during connection changes
- **Smart Toast Management**: Proper toast dismissal and state management

## 🏗️ Architecture

### **Project Structure**
```
lib/
├── bloc/                    # State Management
│   ├── app_bloc.dart       # Main BLoC provider
│   ├── auth_bloc/          # Authentication BLoCs
│   ├── home_bloc/          # Home screen BLoCs
│   ├── navigation_bloc/    # Navigation state
│   └── theme_bloc/         # Theme management
├── data/                   # Data Layer
│   ├── db/                 # Local storage
│   ├── model/              # Data models
│   └── repository/         # API repository
├── helper/                 # Utility classes
├── utils/                  # Constants & utilities
├── view/                   # UI Layer
│   ├── screens/            # Application screens
│   └── widgets/            # Reusable widgets
└── main.dart               # Application entry point
```

### **Architecture Pattern**
- **Presentation Layer**: Screens and Widgets
- **Business Logic Layer**: BLoCs and Events/States
- **Data Layer**: Models, Repository, and Local Storage
- **Utility Layer**: Helpers, Constants, and Extensions

## 🛠️ Technology Stack

### **Core Dependencies**
- **Flutter SDK**: ^3.9.0
- **State Management**: `flutter_bloc: ^8.1.4`
- **HTTP Client**: `dio: ^5.7.0`
- **Local Storage**: `shared_preferences: ^2.3.2`
- **Environment**: `flutter_dotenv: ^5.1.0`

### **UI & UX Libraries**
- **Icons**: `cupertino_icons: ^1.0.8`
- **SVG Support**: `flutter_svg: ^2.0.10+1`
- **Animations**: `shimmer: ^3.0.0`
- **Internationalization**: `intl: ^0.19.0`

### **Connectivity & Network**
- **Network Detection**: `connectivity_plus`
- **Internet Checker**: `internet_connection_checker_plus`

## 📱 Features

### **🔐 Authentication System**
- Login functionality with email/password
- Forgot password with email reset
- Secure token storage
- User data persistence

### **🎨 Theme Management**
- Dynamic light/dark theme switching
- System theme detection
- Persistent theme preferences
- Material Design 3 compliance

### **🌐 Network Management**
- Internet connectivity monitoring
- API error handling
- Request/response logging
- Connection status feedback

### **📱 Navigation**
- Bottom navigation bar
- Route management
- Screen transitions
- Navigation state persistence

### **💾 Data Management**
- Local data storage
- API data caching
- Model serialization
- Error state handling

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK ^3.9.0
- Dart SDK ^3.9.0
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/Saymmughal/flutter_base_bloc
   cd flutter_base_bloc
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Environment Setup**
   - Create a `.env` file in the root directory
   - Add your API configuration:
     ```env
     BASE_URL=https://your-api-domain.com
     ENVIRONMENT=development
     ```

4. **Run the application**
   ```bash
   flutter run
   ```

### **Build Commands**

```bash
# Debug build
flutter run

# Release build (Android)
flutter build apk --release

# Release build (iOS)
flutter build ios --release

# Web build
flutter build web

# Desktop build
flutter build macos
flutter build windows
flutter build linux
```

## 🏗️ BLoC Implementation

### **Core BLoCs**

#### **1. AppBloc**
```dart
class AppBloc extends StatelessWidget {
  // Centralized BLoC provider using MultiBlocProvider
  // Provides all necessary BLoCs to the widget tree
}
```

#### **2. ThemeBloc**
```dart
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // Manages app theme (light/dark/system)
  // Persists theme preferences
  // Provides computed theme properties
}
```

#### **3. AuthBloc**
```dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // Handles authentication logic
  // API communication
  // Local storage operations
}
```

#### **4. NavigationBloc**
```dart
class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  // Manages bottom navigation state
  // Screen index tracking
}
```

### **Event-Driven Architecture**
- **Events**: User actions and system triggers
- **States**: Immutable state representations
- **BLoCs**: Business logic processors
- **Emitters**: State change notifiers

## 🎨 UI Components

### **Custom Widgets**
- `CustomTextField` - Enhanced text input
- `PrimaryButton` - Styled action buttons
- `ThemeToggleWidget` - Theme switching control
- `BottomNavigation` - Custom navigation bar
- `CustomSnackbar` - Toast notifications
- `LoadingDialog` - Loading indicators
- `MessagePopup` - Alert dialogs

### **Screen Structure**
- **Splash Screen** - App initialization
- **Login Screen** - Authentication
- **Home Screen** - Main dashboard
- **Menu Screen** - Navigation menu
- **Theme Demo** - Theme showcase

## 🔧 Configuration

### **Environment Variables**
```dart
// lib/utils/env_configuration/env_config.dart
class EnvConfig {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get environment => dotenv.env['ENVIRONMENT'] ?? 'development';
}
```

### **Theme Configuration**
```dart
// lib/utils/app_styles/app_theme_colors.dart
class AppThemeColors {
  static Color getPrimary(AppThemeMode themeMode) { ... }
  static Color getSurface(AppThemeMode themeMode) { ... }
}
```

### **String Management**
```dart
// lib/utils/app_strings.dart
class AppStrings {
  static const String appTitle = 'Base Project';
  static const String loginText = 'Login';
  // ... 100+ organized strings
}
```

## 📊 State Management

### **BLoC Pattern Benefits**
- **Separation of Concerns**: UI vs Business Logic
- **Testability**: Easy unit testing
- **Predictability**: Unidirectional data flow
- **Reusability**: Shared business logic
- **Performance**: Minimal rebuilds

### **State Lifecycle**
1. **Initial State** → Widget initialization
2. **Event Triggered** → User action or system event
3. **BLoC Processing** → Business logic execution
4. **State Emission** → New state broadcast
5. **UI Rebuild** → Widget tree updates

## ⚡ Performance Optimizations

### Main Thread Optimization
- **Cached Calculations**: Screen dimensions and font scaling cached to prevent repeated calculations
- **Background Operations**: SharedPreferences and network operations run off main thread
- **Debounced Checks**: Connection state changes debounced to prevent excessive network calls
- **Asynchronous UI Updates**: UI operations scheduled after current frame to prevent blocking

### Memory Management
- **Smart Caching**: Dimension and font calculations cached with automatic invalidation
- **Resource Cleanup**: Proper disposal of timers and streams
- **Efficient State Management**: Optimized provider updates to reduce rebuilds

### Performance Monitoring
- **Frame Rate Tracking**: Real-time monitoring of dropped frames in debug mode
- **Performance Metrics**: FPS and frame time monitoring
- **Debug Logging**: Comprehensive logging for performance analysis


## 🧪 Testing
- **Advanced Performance**: Further optimization for large-scale apps

### **Unit Tests**
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### **Test Structure**
```
test/
├── unit/           # BLoC unit tests
├── widget/         # Widget tests
└── integration/    # End-to-end tests
```

## 📱 Platform Support

### **Supported Platforms**
- ✅ **Android** - API 21+ (Android 5.0+)
- ✅ **iOS** - iOS 11.0+
- ✅ **Web** - Modern browsers
- ✅ **macOS** - macOS 10.14+
- ✅ **Windows** - Windows 10+
- ✅ **Linux** - Ubuntu 18.04+

### **Platform-Specific Features**
- **Android**: Material Design, adaptive icons
- **iOS**: Cupertino design, safe area handling
- **Web**: Responsive design, PWA support
- **Desktop**: Native window management

## 🔒 Security Features

### **Data Protection**
- Secure token storage
- API key management
- Input validation
- Error message sanitization

### **Network Security**
- HTTPS enforcement
- Certificate pinning (configurable)
- Request/response encryption
- Secure headers

## 📈 Performance Optimization

### **Optimization Techniques**
- **Lazy Loading**: Widgets loaded on demand
- **State Caching**: BLoC state persistence
- **Image Optimization**: SVG and compressed assets
- **Memory Management**: Proper disposal patterns

### **Performance Monitoring**
- Build performance analysis
- Memory usage tracking
- Frame rate monitoring
- Network request timing

## 🚀 Deployment

### **Release Checklist**
- [ ] Environment configuration
- [ ] API endpoints verification
- [ ] Asset optimization
- [ ] Performance testing
- [ ] Security audit
- [ ] Platform-specific builds

### **CI/CD Integration**
```yaml
# Example GitHub Actions workflow
name: Flutter CI/CD
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter test
      - run: flutter build apk
```

## 🤝 Contributing

### **Development Guidelines**
1. **Code Style**: Follow Flutter linting rules
2. **Architecture**: Maintain BLoC pattern
3. **Testing**: Write tests for new features
4. **Documentation**: Update README and code comments
5. **Commits**: Use conventional commit messages

### **Pull Request Process**
1. Fork the repository
2. Create a feature branch
3. Implement changes with tests
4. Submit a pull request
5. Code review and approval

## 📚 Documentation

### **Additional Resources**
- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Documentation](https://bloclibrary.dev/)
- [Dio HTTP Client](https://pub.dev/packages/dio)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)

### **Project Documentation**
- **API Documentation**: API endpoints and models
- **Widget Documentation**: Custom widget usage
- **BLoC Documentation**: State management patterns
- **Architecture Guide**: Project structure explanation


## 🙏 Acknowledgments

- Flutter team for the amazing framework
- BLoC library contributors
- Open source community
- Project contributors and maintainers

## 📞 Support

### **Getting Help**
- **Issues**: Create GitHub issues for bugs
- **Discussions**: Use GitHub discussions for questions
- **Documentation**: Check project documentation first
- **Community**: Join Flutter community channels

### **Contact Information**
- **Repository**: [GitHub Repository](https://github.com/Saymmughal/flutter_base_bloc)
- **Issues**: [GitHub Issues](https://github.com/Saymmughal/flutter_base_bloc/issues)
- **Email**: Saimmirzapk@gmail.com

---

**Built with ❤️ using Flutter and BLoC**

*Last updated: December 2024*
