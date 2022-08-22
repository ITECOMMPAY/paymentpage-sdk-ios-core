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
            url: "https://github.com/ITECOMMPAY/paymentpage-sdk-ios-core/releases/download/0.4.1/MsdkCore.xcframework.zip",
            checksum: "87b9ba2c0e1e1e73de1d614ae573dd15b2f535474371a096b70b4012f9f73e6a"
        ),
    ]
)