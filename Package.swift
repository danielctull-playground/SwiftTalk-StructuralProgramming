// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "StructuralProgramming",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "StructuralProgramming",
            targets: ["StructuralProgramming"]),
        .library(
            name: "StructuralProgrammingUI",
            targets: ["StructuralProgrammingUI"]),
    ],
    targets: [
        .target(
            name: "StructuralProgramming"),
        .target(
            name: "StructuralProgrammingUI",
            dependencies: ["StructuralProgramming"]),
        .testTarget(
            name: "StructuralProgrammingTests",
            dependencies: ["StructuralProgramming"]),
    ]
)
