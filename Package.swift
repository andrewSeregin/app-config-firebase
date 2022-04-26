// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppConfigFirebase",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "AppConfigFirebase",
            targets: [
                "AppConfigFirebase"
            ]
        ),
    ],
    dependencies: [
        .package(name: "FirebaseRemoteConfigJSON", path: "firebase-remote-config-json")
    ],
    targets: [
        .target(
            name: "AppConfigFirebase",
            dependencies: [
                "FirebaseRemoteConfigJSON"
            ]
        ),
        .testTarget(
            name: "AppConfigFirebaseTests",
            dependencies: [
                "AppConfigFirebase"
            ]
        ),
    ]
)
