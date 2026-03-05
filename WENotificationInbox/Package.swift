// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WENotificationInbox",
    products: [
        .library(name: "WENotificationInbox", targets: ["WENotificationInbox"])
    ],
    targets: [
        .binaryTarget(
            name: "WENotificationInbox",
            url: "https://tmpfiles.org/dl/27354748/wenotificationinbox.xcframework.zip",
            checksum: "d9928f2960ddb7422e509dfd3e33b0235bec3fa7537486878aef1b2ffc567b83"
        )
    ]
)
