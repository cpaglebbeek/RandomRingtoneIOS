// swift-tools-version: 5.9
// RandomRingtoneIOS — SwiftPM skeleton
// Note: dit is een SwiftPM-skeleton voor architectuur-exploratie.
// Een echte iOS-app vereist een Xcode-project (.xcodeproj of XcodeGen).
// Wordt gegenereerd zodra fase 2 (code) start.

import PackageDescription

let package = Package(
    name: "RandomRingtoneIOS",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)  // SwiftUI-Catalyst toekomst
    ],
    products: [
        .library(
            name: "RandomRingtoneCore",
            targets: ["RandomRingtoneCore"]
        ),
    ],
    targets: [
        .target(
            name: "RandomRingtoneCore",
            path: "Sources/RandomRingtoneIOS"
        ),
        .testTarget(
            name: "RandomRingtoneIOSTests",
            dependencies: ["RandomRingtoneCore"],
            path: "Tests/RandomRingtoneIOSTests"
        ),
    ]
)
