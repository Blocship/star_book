<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h1 align="center">StarBook ✨</h1>

  <p align="center">
    A digital diary that can help you in keeping track of your mood and productivity throughout the month. Mood tracker is a good way to see how you are mostly feeling. And it helped me a lot to realise how my general mood is and to improve it. Cause I was feeling down two years ago so now when I look at my mood board it looks much nicer. 
    <br />
    <br />
    <a href="https://hashirshoaeb.com">About Me</a>
    ·
    <a href="https://github.com/hashirshoaeb/star_book/issues">Report Bug</a>
    ·
    <a href="https://github.com/hashirshoaeb/star_book/issues">Request Feature</a>
  </p>
</p>

[![GitHub contributors](https://img.shields.io/github/contributors/hashirshoaeb/star_book?color=ffcc66&style=for-the-badge)](https://github.com/hashirshoaeb/star_book/graphs/contributors)
[![GitHub stars](https://img.shields.io/github/stars/hashirshoaeb/star_book?color=ffcc66&logo=StarBook&style=for-the-badge)](https://github.com/hashirshoaeb/star_book/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/hashirshoaeb/star_book?style=for-the-badge)](https://github.com/hashirshoaeb/star_book/network)
[![GitHub issues](https://img.shields.io/github/issues/hashirshoaeb/star_book?color=ffcc66&style=for-the-badge)](https://github.com/hashirshoaeb/star_book/issues)
[![GitHub license](https://img.shields.io/github/license/hashirshoaeb/star_book?style=for-the-badge)](https://github.com/hashirshoaeb/star_book/blob/master/LICENSE)
[![Twitter Follow](https://img.shields.io/twitter/follow/hashirshoaeb?color=ffcc66&logo=twitter&logoColor=ffffff&style=for-the-badge)](https://twitter.com/hashirshoaeb)
[![Flutter Version](https://img.shields.io/static/v1?label=Flutter&message=1.22.2&color=ffcc66&style=for-the-badge)](https://flutter.dev/docs/development/tools/sdk/releases)

<!-- TABLE OF CONTENTS -->

## Table Of Content

- [About the App](#-about-the-app)
- [MILESTONES](#milestones)
- [Getting Started](#getting-started)
- [Roadmap](#roadmap)
- [Contributing](#-contributing)
- [Demo](#-demo)
- [License](#license)


## 📝 About the App

**“StarBook”** is a digital diary, and a mood tracking app. The user will be able to rate his mood for each day and write a short story for him, like how his day was. Color is given to each mood, let’s say, green for a happy mood, red for angry and yellow for a sad mood. The statistics of users will be visualized in a methodical structure. For this the app will form a graph, calendar, each date box is colored with the color of users' aura lets say green for positive spirits. StarBook will cooperate with users to boost their positive energy and train healthy thinking, correspondingly moving towards calmer and patient personality. StarBook will use positive psychology and cognitive behavioral therapy for you to better understand yourself, overcoming stress, anxiety, and depressions. The app is all in all focused to give personalized experience to every individual user, increasing their productivity, objectivity, and emotional health.

## MILESTONES

### v1.0.0 (First Release)

1. A main screen with Carousel calendar.
2. Set color(mood) on clicking on day.
3. Text input screen to add new or edit diary(story).
4. Save data to the local database (phone’s storage).
5. Profile and Settings Screen

### v > 1.0.0 (Future Updates and Features)

1. Option to sync data to the online database.
2. Option to share Story and Mood statistics to the social media apps
3. UI/UX Improvements.
4. Attach pictures with stories
5. Light and Dark mood
6. Add notifications

<!-- GETTING STARTED -->

## Getting Started

To get a local copy up and running follow these simple example steps.

Prerequisite: https://flutter.dev/docs/get-started/install

1. To get started, fork this repository to your GitHub account.

2. Clone the repo.
    ```sh
     git clone https://github.com/<your-username>/star_book.git
    ```
3. Install packages.
    ```sh
     flutter pub get
    ```
4. Run project.
    ```sh
     flutter run
    ```
   
Steps to use Unsplash Photos to home_page.dart (Optional)

1. Uncomment .env from pubspec.yaml
    ```sh
           assets:
             - .env
    ```
   
2. Add a .env file to the root of your project.

3. Go to https://unsplash.com/developers and register as a developer.

4. Create an App and copy its Access Key.

5. Paste the Access key in the .env file as follows:
    ```sh
     CLIENT_ID=<your-access_key>
   ```

<!-- ROADMAP -->

## Roadmap

See the [project board](https://github.com/hashirshoaeb/star_book/projects/1) for a list of proposed features (and known issues).

## 🤝 Contributing

The App is under development. Are you interested in building and contributing to this awesome app? Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated. To pick something for contribution refer [StarBook board](https://github.com/hashirshoaeb/star_book/projects/1). For more, refer [CONTRIBUTING.md](CONTRIBUTING.md)

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🚀 Demo

App is under development. For now it is like this. With your help we will add more features and functionalities.

### IOS

| Light Mode                                               | Dark Mode                                              |   
|:--------------------------------------------------------:|:------------------------------------------------------:|
| <img src="READMEdocs/demo-light.gif" width="320" ></img> | <img src="READMEdocs/demo-dark.gif" width="320"></img> |

### Android

| Light Mode                                               | Dark Mode                                              |   
|:--------------------------------------------------------:|:------------------------------------------------------:|
| <img src="https://github.com/kanishkaa24/star_book/blob/master/assets/light%20mode.gif?raw=true" width="320" ></img> | <img src="https://github.com/kanishkaa24/star_book/blob/master/assets/dark%20mode.gif?raw=true" width="320"></img> |

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE` for more information.
