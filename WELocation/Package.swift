// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WELocation",
    products: [
        .library(name: "WELocation", targets: ["WELocation"])
    ],
    targets: [
        .binaryTarget(
            name: "WELocation",
            url: "https://tmpfiles.org/dl/27354704/welocation.xcframework.zip",
            checksum: "5314d41eb0ecfa553c94b1d42d9ed26cd84ca1114c20613e57edbe96a7589f68"
        )
    ]
)
