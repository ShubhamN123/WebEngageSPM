// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WEPersonalization",
    products: [
        .library(name: "WEPersonalization", targets: ["WEPersonalization"])
    ],
    targets: [
        .binaryTarget(
            name: "WEPersonalization",
            url: "https://tmpfiles.org/dl/27354769/wepersonalization.xcframework.zip",
            checksum: "1bf628c7b7b2502e6956a817deca84a544ec946841e1ca795b4072ced14b2216"
        )
    ]
)
