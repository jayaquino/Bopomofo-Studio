// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MockProvider",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "MockProvider",
            targets: ["MockProvider"]),
    ],
    dependencies: [
        .package(path: "./CoreBopomofoStudio")
    ],
    targets: [
        .target(
            name: "MockProvider",
            dependencies: [
                .product(name: "CoreBopomofoStudio", package: "CoreBopomofoStudio")
            ]),
        .testTarget(
            name: "MockProviderTests",
            dependencies: ["MockProvider"]),
    ]
)
