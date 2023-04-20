// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConcentricOnboarding",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ConcentricOnboarding",
            targets: ["ConcentricOnboarding"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ConcentricOnboarding",
            dependencies: []
        )
    ]
)
