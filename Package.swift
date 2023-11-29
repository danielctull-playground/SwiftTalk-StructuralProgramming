// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "StructuralProgramming",
    products: [
        .library(
            name: "StructuralProgramming",
            targets: ["StructuralProgramming"]),
    ],
    targets: [
        .target(
            name: "StructuralProgramming"),
        .testTarget(
            name: "StructuralProgrammingTests",
            dependencies: ["StructuralProgramming"]),
    ]
)
