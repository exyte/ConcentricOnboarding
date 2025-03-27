// swift-tools-version: 5.9

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
            dependencies: [],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        )
    ]
)
