// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "ConcentricOnboarding",
	platforms: [
        .iOS(.v13)
    ],
    products: [
    	.library(
    		name: "ConcentricOnboarding", 
    		targets: ["ConcentricOnboarding"]
    	)
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ConcentricOnboarding",
            dependencies: []),
        .testTarget(
            name: "ConcentricOnboardingTests",
            dependencies: ["ConcentricOnboarding"]),
    ],
    swiftLanguageVersions: [.v5]
)
