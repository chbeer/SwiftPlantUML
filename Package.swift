// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPlantUML",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "SwiftPlantUMLFramework",
            targets: ["SwiftPlantUMLFramework"]
        ),
        .executable(name: "swiftplantuml", targets: ["swiftplantuml"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/SourceKitten", from: "0.31.1"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.1.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", branch: "1.9.5"),
    ],
    targets: [
        .target(
            name: "swiftplantuml",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "SwiftPlantUMLFramework",
                .product(name: "SwiftyBeaver", package: "SwiftyBeaver"),
            ]
        ),
        .target(
            name: "SwiftPlantUMLFramework",
            dependencies: [
                .product(name: "SourceKittenFramework", package: "SourceKitten"),
            ]
        ),
        .testTarget(
            name: "SwiftPlantUMLFrameworkTests",
            dependencies: [
                "SwiftPlantUMLFramework",
            ],
            resources: [
                .copy("TestData"),
            ]
        ),
    ]
)
