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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.9.1/MsdkCore.xcframework.zip",
            checksum: "c6b0a1fc5f2482d085187b351f99022d980b4773ba20fa8e51cc9b42d90cc3dc"
        ),
    ]
)
