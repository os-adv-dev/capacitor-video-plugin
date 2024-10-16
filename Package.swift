// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorVideoPlugin",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorVideoPlugin",
            targets: ["VideoPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "VideoPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/VideoPlugin"),
        .testTarget(
            name: "VideoPluginTests",
            dependencies: ["VideoPlugin"],
            path: "ios/Tests/VideoPluginTests")
    ]
)