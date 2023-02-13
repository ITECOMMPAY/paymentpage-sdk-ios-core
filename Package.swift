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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.8.3/MsdkCore.xcframework.zip",
            checksum: "e9afec599e1a03d0fe6d2243fdb69a1e4f1633e0ea6225af3ccc98a625e8714e"
        ),
    ]
)
