// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "webengagespm",
    products: [
        .library(
            name: "webengagespm",
            targets: ["WebEngage","WELocation"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "WebEngage",
            url: "https://tmpfiles.org/dl/28885406/webengageframework.zip",
            checksum: "5259c616db26e125fd3a904578280e6811e88713d7ae99aa6bad52c46edce5a0"
        ),
        .binaryTarget(
            name: "WELocation",
            url: "https://tmpfiles.org/dl/28886268/webengageframework.zip",
            checksum: "59e35a7a9120b3b50f45d0161d86fa2fec2f3997dd34469ed4bd83dd41bb314b"
        ),
        .testTarget(
            name: "WebEngageSPMTests",
            dependencies: ["WebEngage","WELocation"]
        ),
    ]
)
