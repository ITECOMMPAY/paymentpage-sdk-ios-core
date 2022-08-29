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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.4.4/MsdkCore.xcframework.zip",
            checksum: "9beff604cc1cc99586e194812e9bec2466710dd1e4b0491ae72e7a3209dde390"
        ),
    ]
)
