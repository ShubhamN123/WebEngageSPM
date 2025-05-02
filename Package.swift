// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "webengagespm",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "webengagespm",
            targets: ["webengagespm"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        
        .binaryTarget(
            name: "webengagespm",
            url: "https://s3-us-west-2.amazonaws.com/webengage-sdk/ios/WebEngageCore/6.15.0/WebEngageFramework.zip", checksum: "e6c90b3443f9001e2275390532da073e6f4b9dd9bd9a2a173d5e81fdaf16c5e9"
        ),
        .testTarget(
            name: "WebEngageSPMTests",
            dependencies: ["webengagespm"]
        ),
    ]
)
