// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Structural",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Structural",
            targets: ["Structural"]),
        .library(
            name: "StructuralUI",
            targets: ["StructuralUI"]),
    ],
    targets: [
        .target(
            name: "Structural"),
        .target(
            name: "StructuralUI",
            dependencies: ["Structural"]),
        .testTarget(
            name: "StructuralTests",
            dependencies: ["Structural"]),
    ]
)
