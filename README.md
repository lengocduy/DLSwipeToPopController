# DLSwipeToPopController

Reusable iOS's behavior to pop ViewController base on [SwipeRightToPopController](https://github.com/rishi420/SwipeRightToPopController):

- Swipe from Right to Left to pop ViewController.
    - Customize base on `velocity`
- Drag from Right to Left to pop ViewController.
    - Customize base on `percent` of distance with the screen width

## Requirements

- Xcode 11+
- Swift 5.0+

## Installing

There are three ways to install `DLSwipeToPopController`

### 1. CocoaPods

Just add to your project's `Podfile`:

```
pod 'DLSwipeToPopController', '~> 1.1'
```

### 2. Carthage

Add following to `Cartfile`:

```
github "lengocduy/DLSwipeToPopController" ~> 1.1
```

### 3. Swift Package Manager

Create a `Package.swift` file:

```
// swift-tools-version:5.0

import PackageDescription

let package = Package(
        name: "TestSwipeToPopController",

        dependencies: [
            .package(url: "https://github.com/lengocduy/DLSwipeToPopController.git", from: "1.1.2"),
        ],

        targets: [
            .target(
                    name: "TestSwipeToPopController",
                    dependencies: ["DLSwipeToPopController"])
        ]
)

```

## Architecture

![Architecture](https://github.com/lengocduy/DLSwipeToPopController/blob/main/ArchDiagram.png?raw=true)

## License

DLSwipeToPopController is available under the MIT license. See the [LICENSE](LICENSE.md) file for more info.