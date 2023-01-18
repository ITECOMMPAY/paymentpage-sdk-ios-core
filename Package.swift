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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.7.1/MsdkCore.xcframework.zip",
            checksum: "08911a50edcba2562724c24e991c177bd3a3d365c0af09d2b8ac8edb0e9d79c1"
        ),
    ]
)
