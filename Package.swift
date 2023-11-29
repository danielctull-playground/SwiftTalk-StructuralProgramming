// swift-tools-version: 5.9

import CompilerPluginSupport
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
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [

        .target(
            name: "Structural",
            dependencies: ["StructuralMacros"]),

        .macro(
            name: "StructuralMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        .target(
            name: "StructuralUI",
            dependencies: ["Structural"]),
        
        .testTarget(
            name: "StructuralTests",
            dependencies: [
                "Structural",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]),
    ]
)
