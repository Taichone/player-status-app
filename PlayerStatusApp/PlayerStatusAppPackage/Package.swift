// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlayerStatusAppPackage",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "DataLayer",
            targets: ["DataLayer"]
        ),
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        ),
        .library(
            name: "OldDataLayer",
            targets: ["OldDataLayer"]
        ),
        .library(
            name: "OldDomain",
            targets: ["OldDomain"]
        ),
        .library(
            name: "OldPresentation",
            targets: ["OldPresentation"]
        ),
    ],
    targets: [
        .target(
            name: "DataLayer",
            dependencies: []
        ),
        .target(
            name: "Domain",
            dependencies: [
                "DataLayer",
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "DataLayer",
                "Domain",
            ]
        ),
        .target(
            name: "Presentation",
            dependencies: [
                "DataLayer",
                "Domain"
            ]
        ),
        .target(
            name: "OldDataLayer",
            dependencies: []
        ),
        .target(
            name: "OldDomain",
            dependencies: [
                "OldDataLayer",
            ]
        ),
        .target(
            name: "OldPresentation",
            dependencies: [
                "OldDataLayer",
                "OldDomain"
            ]
        ),
    ]
)
