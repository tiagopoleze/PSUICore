// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PSUICore",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v15), .watchOS(.v7)],
    products: [
        .library(name: "PSUICore", targets: ["PSUICore", "UIKitStyles", "PSUIComponents", "DesignSystem"])
    ],
    dependencies: [
        .package(url: "https://github.com/tiagopoleze/PSCore", branch: "main")
    ],
    targets: [
        .target(name: "PSUICore", dependencies: [.product(name: "PSCore", package: "pscore")]),
        .target(name: "DesignSystem", dependencies: ["PSUICore"], resources: [.copy("Token.json")]),
        .target(name: "PSUIComponents", dependencies: ["PSUICore", "DesignSystem"]),
        .target(name: "UIKitStyles", dependencies: ["PSUICore"]),
        .testTarget(name: "PSUICoreTests", dependencies: ["PSUICore"])
    ]
)
