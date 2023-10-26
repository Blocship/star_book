# 🤝 Contributing

Thank you for considering and taking the time to contribute! 💖 

**Working on your first Pull Request?** You can learn how from this _free_ series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github).

The following are guidelines for contributing to this project.

## Getting Started
1. Fork and clone the repository.
2. Create a branch for your Pull Request (PR) with `git checkout -b your-branch-name`.

   **Tip:** Keep your `master` branch pointing at the original repository and make pull requests from branches on your fork. To do this, run:
   ```
   git remote add upstream https://github.com/Blocship/star_book.git
   git fetch upstream
   git branch --set-upstream-to=upstream/master master
   ```
   This will add the original repository as a "remote" called "upstream." Then fetch the Git information from that remote and set your local `master` branch to use the upstream master branch whenever you run `git pull`. You can base all your PR branches on this `master`. When you want to update your version of `master`, do a regular `git pull`.

3. Open an issue to discuss what you are planning to do.
4. Make changes and create a Pull Request.

## Code Guidelines
- Place widgets in the "shared" folder if the widget is shared between 2 or more screens.
- Mark a class as `_Private` if it is not shared or does not need to be exposed to other classes.
- Prefer `const` over `final` for variables.
- Prefer to create `const constructors` for immutable classes.
- Keep the code loosely coupled and highly cohesive.
- Never use dependencies directly in the widgets; prefer to create a service class and use it in the widget.
- Annotate with `@override` for all the methods that are overridden from the superclass.
- Avoid leaving the data types as `dynamic` or `Object`.
- Utilize OOP concepts for code organization and reuse.
- Prefer named parameters over positional parameters.
- (Optional) Prefer `relative-import` over `absolute-import` for our own file imports. Use `absolute-import` for importing from packages. [This extension](https://marketplace.visualstudio.com/items?itemName=luanpotter.dart-import) might help you with this.
- Use snake case for file names.
- The filename should correspond to the name of the primary class in the file.
- Use Camel Case convention for class and enum names.
- Name (classes, variables, functions, modules) in a meaningful way that describes their functionality.
- Ensure that all `.dart` files are formatted using the Flutter format command.

Learn more about linting here: [Effective Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## Architecture Diagram
```
+-----------------+
|                 |
|                 |      +------+  Events  +------+  Request    +----------------+
|                 +----->|      +--------->|      +------------>|                |
|                 |      |  UI  |          | Bloc |             |   Repository   |
|                 |      |      <----------+      <-------------+                |
|                 |      +------+  States  +------+  Response   |                |
|                 |                                              |                |
|                 |      +-------------------------^----------+  +-------^-----+---+
|                 |                   Response |          |                |     |
|                 |                            | Request  |                |     |  Request
|                 |                   +--------+---------v--+               |     |
|                 |                   |                  | | Class         |     |
| +------------+ | +------------+    |                  | |  Object        | +------------+
| | API Provider| | |Local DB    |    | Model            | |               | |   Main.dart  |
| +------------+ | +------------+    |                  | |               | +------------+
|                 |                   |                  | |               |
|                 |                   | +------------+   | +--------+      |
|                 |                   | |API Provider|   | |Local DB|      |
|                 |                   | +------------+   | +--------+      |
|                 |                   |                  |                |
|                 |                   +------------------+                |
+-----------------+                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
                                                                     |
```

## Directory Structure
```
lib
├── data
│   ├── data_source
│   ├── models
│   ├── repository
│   └── utils
├── domain
│   ├── models
│   └── repository
├── presentation
│   ├── service
│   ├── shared
│   ├── theme
│   ├── utils
│   └── screen
└── main.dart
```

## Routes
```
routes
├── / (SplashScreen)
├── /intro (IntroScreen)
├── /main (MainScreen)
│   ├── /main/year?year=2023 (YearScreen)
│   │   └── /main/year/month?year=2023&month=4 (HomeScreen)
│   └── /main/profile (ProfileScreen)
│       ├── /main/profile/analytics (AnalyticsScreen)
│       └── /main/profile/settings (SettingsScreen)
│           └── /main/profile/settings/license (LicenseAgreementScreen) 
├── /journal?date=2023-01-01 (JournalsListScreen)
│   ├── /journal/new?date=2023-01-01 (JournalCreateScreen)
│   └── /journal/:id (JournalDetailScreen)
│       └── /journal/:id/edit (EditJournalScreen)
```

## 🐛 How to Report Bugs
Please open a [new issue](https://github.com/Blocship/star_book/issues/new) including steps to reproduce the problem you're experiencing. Be sure to include as much information as possible, including screenshots, text output, and both your expected and actual results.

## 🙏 Help Needed
Please check out the [issues](https://github.com/Blocship/star_book/issues) and [project board](https://github.com/users/hashirshoaeb/projects/1).

<br />
<p align="center">
  <h1 align="center">Thanks  ✨</h1>
</p>

## Acknowledgments
Websites that helped me throughout the project:

- [Medium: Learning Flutter's New Navigation and Routing System](https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade)
- [YouTube: Flutter Tutorial - Full Course](https://www.youtube.com/watch?v=nyvwx7o277U)
- [Apple: Human Interface Guidelines for iOS](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/)
- [Flutter API: TextEditingController Class](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)
- [Flutter Cookbook: Handling Changes to a Text Field](https://flutter.dev/docs/cookbook/forms/text-field

-changes)
- [Flutter API: CupertinoTextField Class](https://api.flutter.dev/flutter/cupertino/CupertinoTextField-class.html)
- [FreeCodeCamp: How to Delete a Git Branch (Locally and Remotely)](https://www.freecodecamp.org/news/how-to-delete-a-git-branch-both-locally-and-remotely/)
- [Dart: Effective Dart - Documentation](https://dart.dev/guides/language/effective-dart/documentation)
- [YouTube: Flutter Development - Full Course](https://www.youtube.com/watch?v=YPLs3xrDcm0)
- [Flutter Documentation: Deployment on iOS](https://flutter.dev/docs/deployment/ios)

---
