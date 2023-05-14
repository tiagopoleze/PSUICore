// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PSUICore",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v13), .watchOS(.v7)],
    products: [
        .library(
            name: "PSUICore",
            targets: ["PSUICore", "UIKitStyles", "PSUIComponents"]
        ),
    ],
    dependencies: [
        .package(url: "https://tiagopoleze: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@github.com/tiagopoleze/SwiftlintPlugin", branch: "main"),
        .package(url: "https://tiagopoleze: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@github.com/tiagopoleze/PSCore", branch: "main")
    ],
    targets: [
        .target(
            name: "PSUICore",
            dependencies: ["PSCore"],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")]
        ),
        .target(
            name: "PSUIComponents",
            dependencies: ["PSUICore"],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")]
        ),
        .target(
            name: "UIKitStyles",
            dependencies: ["PSUICore"],
            plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")]
        ),
        .testTarget(
            name: "PSUICoreTests",
            dependencies: ["PSUICore"]
        )
    ]
)
