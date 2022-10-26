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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.5.2/MsdkCore.xcframework.zip",
            checksum: "c13eaec069662da5ec9c0aaa5c4fc439150b407093bfc276e2b52a760b1b2fd2"
        ),
    ]
)
