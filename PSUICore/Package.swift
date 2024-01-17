// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PSUICore",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v15), .watchOS(.v7)],
    products: [
        .library(name: "PSUICore", targets: ["PSUICore"])
    ],
    dependencies: [.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")],
    targets: [
        .target(name: "PSUICore", resources: [.copy("DesignSystem/Token.json")]),
        .testTarget(name: "PSUICoreTests", dependencies: ["PSUICore"])
    ]
)
