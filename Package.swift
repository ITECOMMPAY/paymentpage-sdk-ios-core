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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.8.5/MsdkCore.xcframework.zip",
            checksum: "f98161449d787bf048d26d84ec7f9d5eedcf9d71eaf86307c1bb944a7f19c35a"
        ),
    ]
)
