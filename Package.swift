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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.8.8/MsdkCore.xcframework.zip",
            checksum: "5cf4e9f8b27ef476f1e24b277bc9c7af5fa247e9376b56d75fc4bba1769c08bc"
        ),
    ]
)
