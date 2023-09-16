```
# Flutter Project: Your Project Name

A Flutter project that demonstrates various essential Flutter development aspects, including UI implementation, state management, networking, testing, error handling, and code quality.

## Task Overview

### Task 1: UI Implementation (15 minutes)

- Created a new Flutter project.
- Implemented a screen with a list of cards, each containing an image, title, and description.
- Utilized `ListView.builder` for efficient list rendering.
- Applied proper styling using `Container`, `TextStyle`, and `Card` widgets.

### Task 2: State Management and Interaction (15 minutes)

- Converted the screen to use a `StatefulWidget`.
- Implemented a "Favorite" button on each card.
- Added logic to toggle the favorite state of each card.
- Updated the UI to reflect the changes in the favorite state.

### Task 3: Networking and Asynchronous Operations (10 minutes)

- Integrated the `http` package.
- Created a function to fetch additional data from an API endpoint.
- Displayed a loading indicator while fetching data.
- Updated the list with the new data when fetched successfully.

### Task 4: Navigation and Routing (10 minutes)

- Implemented a detail screen that shows more information about a selected card.
- Set up navigation between the list screen and the detail screen.
- Passed necessary data between screens using route parameters.

### Task 5: Testing (10 minutes)

- Wrote unit tests for the favorite state toggling logic.
- Wrote a widget test to ensure the list items are displayed correctly.
- Wrote an integration test to simulate navigating from the list to the detail screen.

### Task 6: Error Handling and Fallbacks (5 minutes)

- Implemented error handling for network requests.
- Displayed an error message when fetching data fails.
- Provided a "Retry" button to attempt fetching data again.

### Task 7: Documentation and Code Quality (5 minutes)

- Added comments to important parts of the code for clarification.
- Ensured code follows Flutter's style guide and best practices.

## Dummy Data

```dart
final List<Map<String, String>> dummyData = [
  {
    'image': 'image_url_1',
    'title': 'Card 1',
    'description': 'Description for Card 1',
  },
  {
    'image': 'image_url_2',
    'title': 'Card 2',
    'description': 'Description for Card 2',
  },
  // Add more dummy data entries as needed
];
```

## Getting Started

Follow these steps to get started with this project:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/ioabdullahi/onboarding_flutter_test.git
   ```

2. Navigate to the project directory:

   ```bash
   cd your-project
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```
