// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "DLSwipeToPopController",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "DLSwipeToPopController", 
            targets: ["DLSwipeToPopController"]
        )
    ],
    targets: [
        .target(
            name: "DLSwipeToPopController",
            dependencies: [],
            path: "DLSwipeToPopController"
        )
    ]
)
