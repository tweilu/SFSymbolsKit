// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFSymbolsKit",
    platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)],
    products: [
        .library(name: "SFSymbolsKit", targets: ["SFSymbolsKit"]),
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "SFSymbolsGenerator",
            dependencies: [],
            resources: [.process("Resources")]),
        .target(
            name: "SFSymbolsKit",
            dependencies: []),
        .testTarget(
            name: "SFSymbolsKitTests",
            dependencies: ["SFSymbolsKit"]),
    ]
)
