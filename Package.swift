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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.5.1/MsdkCore.xcframework.zip",
            checksum: "edc197929fd52c4e9ca6770c723c4d398f87a212d6e039fdfd2fff2301ff9fae"
        ),
    ]
)
