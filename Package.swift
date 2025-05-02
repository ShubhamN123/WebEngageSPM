// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WebEngageSPM",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WebEngageSPM",
            targets: ["WebEngageSPM"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        
        .binaryTarget(
            name: "WebEngageSPM",
            url: "https://s3-us-west-2.amazonaws.com/webengage-sdk/ios/WebEngageCore/6.15.0/WebEngageFramework.zip", checksum: "6cbf358c9e875f0e5c9eb3c37c57a725b307e285018c4f7dd45fcdf5b635f739"
        ),
        .testTarget(
            name: "WebEngageSPMTests",
            dependencies: ["WebEngageSPM"]
        ),
    ]
)
