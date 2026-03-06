// swift-tools-version:5.6

/* Copyright (c) 2017 WebEngage

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/


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
            url: "https://s3-us-west-2.amazonaws.com/webengage-sdk/ios/WebEngageCore/6.20.0/WebEngageFramework.zip",
            checksum: "b68aa09c04fb1724b67498309445ad291f7be43fb9c14a43233ee2deb44c0aa4"
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
            url: "https://webengage-sdk.s3.us-west-2.amazonaws.com/ios/WEPersonalization/1.5.0/WEPersonalization.zip",
            checksum: "571547fbc2393fbc298d865096dfa303dc6da93b218d21ca8857676fd16bfe13"
        )
    ]
)
