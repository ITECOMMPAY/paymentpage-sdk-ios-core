// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "MsdkCore",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "MsdkCore",
            targets: ["MsdkCore"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "MsdkCore",
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.8.7/MsdkCore.xcframework.zip",
            checksum: "0af66e14475b3c53e79c98ef75f1bf5bc42f86f6d4231b8ff9738d2903c4eae8"
        ),
    ]
)
