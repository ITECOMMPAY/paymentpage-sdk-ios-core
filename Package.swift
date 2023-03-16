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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.8.4/MsdkCore.xcframework.zip",
            checksum: "2c7f02e59148f9450f626155db8d867a598628a7c52fcf81a4dd29ff7d7f36b8"
        ),
    ]
)
