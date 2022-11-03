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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.5.3/MsdkCore.xcframework.zip",
            checksum: "a3cb263da9f9a4cb4f17fb1d666ab7eb30930a664ee3c7a19707981a14bb5684"
        ),
    ]
)
