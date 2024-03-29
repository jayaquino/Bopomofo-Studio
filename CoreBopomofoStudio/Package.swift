// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreBopomofoStudio",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CoreBopomofoStudio",
            targets: ["CoreBopomofoStudio"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CoreBopomofoStudio",
            dependencies: []),
        .testTarget(
            name: "CoreBopomofoStudioTests",
            dependencies: ["CoreBopomofoStudio"]),
    ]
)
