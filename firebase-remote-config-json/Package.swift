// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseRemoteConfigJSON",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "FirebaseRemoteConfigJSON",
            targets: ["FirebaseRemoteConfigJSON"]),
    ],
    dependencies: [
        .package(
            name: "Firebase",
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            .upToNextMajor(from: "8.0.0")
        ),
    ],
    targets: [
        .target(
            name: "FirebaseRemoteConfigJSON",
            dependencies: [
                .product(name: "FirebaseRemoteConfig", package: "Firebase")
            ]),
        .testTarget(
            name: "FirebaseRemoteConfigJSONTests",
            dependencies: [
                "FirebaseRemoteConfigJSON"
            ]),
    ]
)
