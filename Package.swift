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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.4.5/MsdkCore.xcframework.zip",
            checksum: "a28b61839f824d17a3d14c263593ad4a93a2a6188943203fa2b0e135dd9e3e4d"
        ),
    ]
)
