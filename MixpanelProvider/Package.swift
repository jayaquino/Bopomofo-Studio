// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MixpanelProvider",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "MixpanelProvider",
            targets: ["MixpanelProvider"]),
    ],
    dependencies: [
        .package(path: "./CoreBopomofoStudio"),
        .package(url: "https://github.com/mixpanel/mixpanel-swift.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "MixpanelProvider",
            dependencies: [
                .product(name: "CoreBopomofoStudio", package: "CoreBopomofoStudio"),
                .product(name: "Mixpanel", package: "mixpanel-swift")
            ]),
        .testTarget(
            name: "MixpanelProviderTests",
            dependencies: ["MixpanelProvider"]),
    ]
)
