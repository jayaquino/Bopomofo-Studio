// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseProvider",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "FirebaseProvider",
            targets: ["FirebaseProvider"]),
    ],
    dependencies: [
        .package(path: "./CoreBopomofoStudio"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", branch: "master")
    ],
    targets: [
        .target(
            name: "FirebaseProvider",
            dependencies: [
                .product(name: "CoreBopomofoStudio", package: "CoreBopomofoStudio"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
                .product(name: "FirebaseDatabase", package: "firebase-ios-sdk")
            ]),
        .testTarget(
            name: "FirebaseProviderTests",
            dependencies: ["FirebaseProvider"]),
    ]
)
