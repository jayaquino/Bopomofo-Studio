// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseProvider",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FirebaseProvider",
            targets: ["FirebaseProvider"]),
    ],
    dependencies: [
        .package(path: "./CoreBopomofoStudio"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "9.0.0")
    ],
    targets: [
        .target(
            name: "FirebaseProvider",
            dependencies: [
                .product(name: "CoreBopomofoStudio", package: "CoreBopomofoStudio"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ]),
        .testTarget(
            name: "FirebaseProviderTests",
            dependencies: ["FirebaseProvider"]),
    ]
)
