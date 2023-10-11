# 🤝 Contributing

Thank you for considering and taking the time to contribute! 💖 

**Working on your first Pull Request?** You can learn how from this _free_
series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

The following are guidelines for contributing to this project.

1. Fork and clone the repo.

2. Create a branch for your PR with `git checkout -b your-branch-name`

> Tip: Keep your `master` branch pointing at the original repository and make
> pull requests from branches on your fork. To do this, run:
>
> ```
> git remote add upstream https://github.com/hashirshoaeb/star_book.git
> git fetch upstream
> git branch --set-upstream-to=upstream/master master
> ```
>
> This will add the original repository as a "remote" called "upstream," Then
> fetch the git information from that remote, then set your local `master`
> branch to use the upstream master branch whenever you run `git pull`. Then you
> can make all of your pull request branches based on this `master` branch.
> Whenever you want to update your version of `master`, do a regular `git pull`.

3. Open Issue, discuss what you are planning to do.

4. Make changes and create Pull Request.

## Code GuideLines

- Put widget in shared folder if the widget is shared between 2 or more screens.
- Make a class _Private if it is not shared or does not needed to be exposed for other classes
- Prefer `const` over `final` for variables.
- Prefer to create `const constructors` for immutable classes.
- Keep the code loosely coupled and highly cohesive.
- Never use dependencies directly in the widgets, prefer to create a service class and use it in the widget.
- Annotate with `@override` for all the methods that are overridden from the super class.
- Never leave the data types as `dynamic` or `Object`.
- Use OOP concepts for code organization and reuse.
- Prefer named parameters over positional parameters.
- (Optional) Prefer `relative-import` over `absolute-import` for (our own) file imports. Use `absolute-import` for importing from the packages. [This extension](https://marketplace.visualstudio.com/items?itemName=luanpotter.dart-import) might help you with this. 
- Use snake case for file names.
- The filename should correspond to the name of the primary class in the file.
- Names of files that contains widgets that take the whole screen should end with the suffix: _screen.dart, for example, signup or login takes up the whole screen for authentication.
- Use Camel Case convention for class and enum names.
- Name (classes, variables, functions, modules) in a meaningful name which describe its functionality.
- Make sure that all .dart files are formatted using flutter format command.

Read more from linting here: https://dart.dev/guides/language/effective-dart/style

## Architecture Diagram

```
                                       +-----------------+
                                       |                 |
+------+  Events  +------+  Request    |                 |
|      +--------->|      +------------>|                 |
|  UI  |          | Bloc |             |   Repository    |
|      <----------+      <-------------+                 |
+------+  States  +------+  Response   |                 |
                                       |                 |
                                       +-------^-----+---+
                                               |     |
                                      Response |     |  Request
                                               |     |
                                       +-------+-----v--+
                                       |                |
                             Class     | +------------+ |
                  +-------+  Object    | |API Provider| |
                  |       +----------->| +------------+ |
                  | Model |            |                |
                  |       <------------+   +--------+   |
                  +-------+   Json     |   |Local DB|   |
                                       |   +--------+   |
                                       |                |
                                       +----------------+
```

## Directory Structure

```
lib
├── data
│   ├── data_source
│   ├── models
│   ├── repository
|   └── utils
├── domain
│   ├── models
|   └── repository
├── presentation
│   ├── service
│   ├── shared
│   ├── theme
│   ├── utils
|   └── screen
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

Please open a [new issue](https://github.com/hashirshoaeb/star_book/issues/new) including steps to reproduce the problem
you're experiencing.

Be sure to include as much information including screenshots, text output, and
both your expected and actual results.

## 🙏 Help needed

Please check out the [issues](https://github.com/hashirshoaeb/star_book/issues) and [project board](https://github.com/users/hashirshoaeb/projects/1) for any current concerns or topics related to the project. Additionally, we now use Discord for project management and communication. Feel free to join our [Discord server](https://discord.gg/7EJv8VUGrd) for the latest updates and discussions.

<br />
<p align="center">
  <h1 align="center">Thanks  ✨</h1>
</p>

## Acknowledgements

Websites that helped me in making this project through out.

- https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
- https://www.youtube.com/watch?v=nyvwx7o277U
- https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
- https://api.flutter.dev/flutter/widgets/TextEditingController-class.html
- https://flutter.dev/docs/cookbook/forms/text-field-changes
- https://api.flutter.dev/flutter/cupertino/CupertinoTextField-class.html
- https://www.freecodecamp.org/news/how-to-delete-a-git-branch-both-locally-and-remotely/
- https://dart.dev/guides/language/effective-dart/documentation
- https://www.youtube.com/watch?v=YPLs3xrDcm0
- https://flutter.dev/docs/deployment/ios