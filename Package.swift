// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to
// build this package.

// Copyright (c) 2017 WebEngage
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import PackageDescription

let package = Package(
    name: "webengage-ios-sdk",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WebEngage", targets: ["WebEngage","WELocation"]),
        .library(name: "WebEngageCore", targets: ["WebEngage"]),
        .library(name: "WebEngageLocation", targets: ["WELocationWrapper"]),
        .library(name: "WebEngagePersonalization", targets: ["WEPersonalizationWrapper"]),
        .library(name: "WebEngageNotificationInbox", targets: ["WENotificationInboxWrapper"])
   
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
        ),
        .target(
            name: "WELocationWrapper",
            dependencies: ["WebEngage", "WELocation"],
            path: "Sources/WELocationWrapper"
        ),
        .target(
            name: "WENotificationInboxWrapper",
            dependencies: ["WebEngage", "WENotificationInbox"],
            path: "Sources/WENotificationInboxWrapper"
        ),
        .target(
            name: "WEPersonalizationWrapper",
            dependencies: ["WebEngage", "WEPersonalization"],
            path: "Sources/WEPersonalizationWrapper"
        )
    ]
)
