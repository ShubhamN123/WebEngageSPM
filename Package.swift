// swift-tools-version:5.6

// Copyright (c) 2017 WebEngage

import PackageDescription

let package = Package(
    name: "WebEngage",
    products: [
        .library(name: "WebEngage", targets: ["WebEngage","WELocation"]),
        .library(name: "WebEngageCore", targets: ["WebEngage"]),
        .library(name: "WELocation", targets: ["WELocation"]),
        .library(name: "WEPersonalization", targets: ["WEPersonalization"]),
        .library(name: "WENotificationInbox", targets: ["WENotificationInbox"])
   
    ],
    targets: [
        .binaryTarget(
            name: "WebEngage",
            url: "https://webengage-sdk.s3.us-west-2.amazonaws.com/ios/spm/beta-01/WebEngage.xcframework.zip",
            checksum: "b94c92e9d3b47b4c2f1bb93b24e25809fcd8a3d80e54006c2c4dce0b7a7339f5"
        ),
        .binaryTarget(
            name: "WELocation",
            url: "https://webengage-sdk.s3.us-west-2.amazonaws.com/ios/spm/beta-01/WELocation.xcframework.zip",
            checksum: "5314d41eb0ecfa553c94b1d42d9ed26cd84ca1114c20613e57edbe96a7589f68"
        ),
        .binaryTarget(
            name: "WENotificationInbox",
            url: "https://webengage-sdk.s3.us-west-2.amazonaws.com/ios/spm/beta-01/WENotificationInbox.xcframework.zip",
            checksum: "d9928f2960ddb7422e509dfd3e33b0235bec3fa7537486878aef1b2ffc567b83"
        ),
        .binaryTarget(
            name: "WEPersonalization",
            url: "https://webengage-sdk.s3.us-west-2.amazonaws.com/ios/spm/beta-01/WEPersonalization.xcframework.zip",
            checksum: "1bf628c7b7b2502e6956a817deca84a544ec946841e1ca795b4072ced14b2216"
        )
    ]
)
