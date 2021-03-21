fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios do_sign
```
fastlane ios do_sign
```
Match —— Easily sync certificates and profiles across team
### ios do_build
```
fastlane ios do_build
```
Gym —— builds and packages iOS apps. It makes it super easy to generate a signed ipa or app file.
### ios do_beta
```
fastlane ios do_beta
```
Pilot —— Upload new binary to App Store Connect for TestFlight beta testing.
### ios do_release
```
fastlane ios do_release
```
Release

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
