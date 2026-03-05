// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WebEngage",
    products: [
        .library(name: "WebEngage", targets: ["WebEngage"])
    ],
    targets: [
        .binaryTarget(
            name: "WebEngage",
            url: "https://tmpfiles.org/dl/27354503/webengage.xcframework.zip",
            checksum: "b94c92e9d3b47b4c2f1bb93b24e25809fcd8a3d80e54006c2c4dce0b7a7339f5"
        )
    ]
)
