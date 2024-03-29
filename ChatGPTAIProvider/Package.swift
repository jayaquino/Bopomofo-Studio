// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatGPTAIProvider",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ChatGPTAIProvider",
            targets: ["ChatGPTAIProvider"]),
    ],
    dependencies: [
        .package(path: "./CoreBopomofoStudio"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ChatGPTAIProvider",
            dependencies: [
                .product(name: "CoreBopomofoStudio", package: "CoreBopomofoStudio"),
                .product(name: "Alamofire", package: "Alamofire")
            ]),
        .testTarget(
            name: "ChatGPTAIProviderTests",
            dependencies: ["ChatGPTAIProvider"]),
    ]
)
