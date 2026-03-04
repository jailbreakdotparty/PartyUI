// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PartyUI",
    platforms: [.iOS("16.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PartyUI",
            targets: ["PartyUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Cindori/FluidGradient.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PartyUI",
            dependencies: [
                .product(name: "FluidGradient", package: "FluidGradient")
            ]
        ),
    ]
)
