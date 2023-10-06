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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.10.1/MsdkCore.xcframework.zip",
            checksum: "3713461a77cb7fe2c5c792198d02916c5c8c5dffe8e9baeef18fb1b06db7f51e"
        ),
    ]
)
