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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.10.0/MsdkCore.xcframework.zip",
            checksum: "ff1686aeaffe341da8fd28777422f8642c8b07a04c920d8c75bd89bc9fb1297e"
        ),
    ]
)
