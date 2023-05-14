// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PSUICore",
    products: [
        .library(name: "PSUICore", targets: ["PSUICore", "UIKitStyles", "PSUIComponents"])
    ],
    dependencies: [
        .package(url: "https://github.com/tiagopoleze/PSCore", branch: "main")
    ],
    targets: [
        .target(name: "PSUICore", dependencies: ["PSCore"]),
        .target(name: "PSUIComponents", dependencies: ["PSUICore"]),
        .target(name: "UIKitStyles", dependencies: ["PSUICore"]),
        .testTarget(name: "PSUICoreTests", dependencies: ["PSUICore"])
    ]
)
