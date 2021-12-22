// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "ConcentricOnboarding",
	platforms: [
        .iOS(.v14)
    ],
    products: [
    	.library(
    		name: "ConcentricOnboarding", 
    		targets: ["ConcentricOnboarding"]
    	)
    ],
    targets: [
        .target(
            name: "ConcentricOnboarding",
            path: "Source"
        )
    ],
    swiftLanguageVersions: [.v5]
)