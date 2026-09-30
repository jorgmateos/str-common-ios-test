# str-common-ios-test

Minimal SwiftUI app to test [str-common-skp](https://github.com/jorgmateos/str-common-skp) on iOS.
It runs `HelloWorldUseCase` and `TodoUseCase` on launch and from buttons.

## Run

```bash
brew install xcodegen
xcodegen generate
open STRCommonTestApp.xcodeproj
```

The library is consumed via Swift Package Manager (`project.yml`, `from: "0.1.0"`).
Use *File ▸ Packages ▸ Update to Latest Package Versions* to pick up new releases.
