// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WebEngageSPM",
    products: [
        .library(name: "WebEngage", targets: ["WebEngage"]),
        .library(name: "WELocation", targets: ["WELocation"]),
        .library(name: "WENotificationInbox", targets: ["WENotificationInbox"]),
        .library(name: "WEPersonalization", targets: ["WEPersonalization"])
    ],
    targets: [
        .binaryTarget(
            name: "WebEngage",
            url: "https://tmpfiles.org/dl/27354503/webengage.xcframework.zip",
            checksum: "b94c92e9d3b47b4c2f1bb93b24e25809fcd8a3d80e54006c2c4dce0b7a7339f5"
        ),
        .binaryTarget(
            name: "WELocation",
            url: "https://tmpfiles.org/dl/27354704/welocation.xcframework.zip",
            checksum: "5314d41eb0ecfa553c94b1d42d9ed26cd84ca1114c20613e57edbe96a7589f68"
        ),
        .binaryTarget(
            name: "WENotificationInbox",
            url: "https://tmpfiles.org/dl/27354748/wenotificationinbox.xcframework.zip",
            checksum: "d9928f2960ddb7422e509dfd3e33b0235bec3fa7537486878aef1b2ffc567b83"
        ),
        .binaryTarget(
            name: "WEPersonalization",
            url: "https://tmpfiles.org/dl/27354769/wepersonalization.xcframework.zip",
            checksum: "1bf628c7b7b2502e6956a817deca84a544ec946841e1ca795b4072ced14b2216"
        )
    ]
)
