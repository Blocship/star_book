<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h1 align="center">Starbook ⭐️</h1>
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


[![Twitter Follow](https://img.shields.io/twitter/follow/hashirshoaeb?color=ffcc66&logo=twitter&logoColor=ffffff&style=for-the-badge)](https://twitter.com/hashirshoaeb)
[![GitHub license](https://img.shields.io/github/license/hashirshoaeb/star_book?style=for-the-badge)](https://github.com/hashirshoaeb/star_book/blob/master/LICENSE)
[![Flutter Version](https://img.shields.io/static/v1?label=Flutter&message=3.10.1&color=ffcc66&style=for-the-badge)](https://flutter.dev/docs/development/tools/sdk/releases)

## Get the App


<div>
  <a 
    href="https://apps.apple.com/us/app/starbook-journal-ai-diary/id1552418289?itsct=apps_box&amp;itscg=30200"
    >
    <img
      align="center"
      style="height: 50px"
      src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/white/en-US" 
      alt="Download Starbook on App Store"/>
  </a>
  <a 
    href="https://play.google.com/store/apps/details?id=com.hashirshoaeb.StarBook">
      <img
        align="center"
        style="height: 75px"
        src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"
        alt="Get Starbook on Google Play"/>
  </a>
</div>

## 📝 About the App

**“StarBook”** is a digital diary, and a mood tracking app. The user will be able to rate his mood for each day and write a short story for him, like how his day was. Color is given to each mood, let’s say, green for a happy mood, red for angry and yellow for a sad mood. The statistics of users will be visualized in a methodical structure. For this the app will form a graph, calendar, each date box is colored with the color of users' aura lets say green for positive spirits. StarBook will cooperate with users to boost their positive energy and train healthy thinking, correspondingly moving towards calmer and patient personality. StarBook will use positive psychology and cognitive behavioral therapy for you to better understand yourself, overcoming stress, anxiety, and depressions. The app is all in all focused to give personalized experience to every individual user, increasing their productivity, objectivity, and emotional health.


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
## Run project
  - Run project on development.
      ```sh
       flutter run --dart-define=flavor=dev
      ```
  - Run project in staging(debug mode).
      ```sh
      flutter run --dart-define=flavor=qa
      ```
  - Run project in production.
      ```sh
        flutter run --dart-define-from-file=.env.prod.json
      ```
## Deploy project
  - Deploy to iOS.
      ```sh
      flutter build ipa --release --dart-define-from-file=.env.prod.json
      ```
  -   Deploy to Android.
         ```sh
        flutter build appbundle --release --dart-define-from-file=.env.prod.json
        ```
where .env.prod.json is the file containing the production environment variables as like the following.
```json
{
  "flavor": "prod",
  "apiKey": "<FIREBASE_API_KEY>",
  "appIdAndroid": "<FIREBASE_APP_ID>",
  "appIdIos": "<FIREBASE_APP_ID>",
  "messagingSenderId": "<FIREBASE_MESSAGING_SENDER_ID>",
  "projectId": "<FIREBASE_PROJECT_ID>",
  "storageBucket": "<FIREBASE_STORAGE_BUCKET>",
  "iosBundleId": "<IOS_BUNDLE_ID>",
}
```

## Support my work

If you found this project valuable, please consider giving it a ⭐️ on GitHub. Your support keeps me motivated! If you'd like to further support my work, you can buy me a book. Thank you for your generosity!

<div>
  <a href="https://www.buymeacoffee.com/hashirshoaeb"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a book&emoji=📖&slug=hashirshoaeb&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00" /></a>
 </div>

## 🤝 Contributing

Are you interested in building and contributing to this awesome app? Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated. To pick something for contribution refer [StarBook board](https://github.com/Blocship/star_book/issues). For more, refer [CONTRIBUTING.md](CONTRIBUTING.md)

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
