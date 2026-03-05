// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "webengagespm",
    products: [
        .library(name: "WebEngage", targets: ["WebEngageWrapper"]),
        .library(name: "WELocation", targets: ["WELocationWrapper"]),
        .library(name: "WENotificationInbox", targets: ["WENotificationInboxWrapper"]),
        .library(name: "WEPersonalization", targets: ["WEPersonalizationWrapper"])
    ],
    targets: [
        .binaryTarget(
            name: "WebEngageBinary",
            url: "https://tmpfiles.org/dl/27354503/webengage.xcframework.zip",
            checksum: "b94c92e9d3b47b4c2f1bb93b24e25809fcd8a3d80e54006c2c4dce0b7a7339f5"
        ),
        .binaryTarget(
            name: "WELocationBinary",
            url: "https://tmpfiles.org/dl/27354704/welocation.xcframework.zip",
            checksum: "5314d41eb0ecfa553c94b1d42d9ed26cd84ca1114c20613e57edbe96a7589f68"
        ),
        .binaryTarget(
            name: "WENotificationInboxBinary",
            url: "https://tmpfiles.org/dl/27354748/wenotificationinbox.xcframework.zip",
            checksum: "d9928f2960ddb7422e509dfd3e33b0235bec3fa7537486878aef1b2ffc567b83"
        ),
        .binaryTarget(
            name: "WEPersonalizationBinary",
            url: "https://tmpfiles.org/dl/27354769/wepersonalization.xcframework.zip",
            checksum: "1bf628c7b7b2502e6956a817deca84a544ec946841e1ca795b4072ced14b2216"
        ),
        .target(
            name: "WebEngageWrapper",
            dependencies: ["WebEngageBinary"],
            path: "Sources/WebEngageWrapper"
        ),
        .target(
            name: "WELocationWrapper",
            dependencies: ["WELocationBinary"],
            path: "Sources/WELocationWrapper"
        ),
        .target(
            name: "WENotificationInboxWrapper",
            dependencies: ["WENotificationInboxBinary"],
            path: "Sources/WENotificationInboxWrapper"
        ),
        .target(
            name: "WEPersonalizationWrapper",
            dependencies: ["WEPersonalizationBinary"],
            path: "Sources/WEPersonalizationWrapper"
        )
    ]
)
