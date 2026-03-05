// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "webengagespm",
    products: [
        .library(name: "WebEngage", targets: ["WebEngage"]),
        .library(name: "WELocation", targets: ["WELocation"]),
        .library(name: "WENotificationInbox", targets: ["WENotificationInbox"]),
        .library(name: "WEPersonalization", targets: ["WEPersonalization"])
    ],
    targets: [
        .binaryTarget(name: "WebEngage", path: "Sources/WebEngageSPM/xcFrameworks/WebEngage.xcframework"),
        .binaryTarget(name: "WELocation", path: "Sources/WebEngageSPM/xcFrameworks/WELocation.xcframework"),
        .binaryTarget(name: "WENotificationInbox", path: "Sources/WebEngageSPM/xcFrameworks/WENotificationInbox/WENotificationInbox.xcframework"),
        .binaryTarget(name: "WEPersonalization", path: "Sources/WebEngageSPM/xcFrameworks/WEPersonalization/WEPersonalization.xcframework")
    ]
)
