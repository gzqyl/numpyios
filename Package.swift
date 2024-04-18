// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NumPy-iOS",
    products: [
        .library(
            name: "NumPy-iOS",
            targets: ["libnumpy", "libnpymath", "libnpyrandom", "LinkNumpy", "NumPySupport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gzqyl/pyios", .branch("master")),
    ],
    targets: [
        .binaryTarget(name: "libnumpy", url: "https://github.com/gzqyl/numpyios/releases/download/binaryxc/libnumpy.xcframework.zip", checksum: "99ae0916f33840cf9c97b423147e00c8ec5e0eb5e68d1a36731f230309d9d40c"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/gzqyl/numpyios/releases/download/binaryxc/libnpymath.xcframework.zip", checksum: "962737e93074862f41d48c127a243e19b1979a1949382ea7dc3746075739d8fc"),
        .binaryTarget(name: "libnpyrandom", url: "https://github.com/gzqyl/numpyios/releases/download/binaryxc/libnpyrandom.xcframework.zip", checksum: "11527be142959412b036b43cc4b93c8fea29802bb4652f1ce561e97c93bf0a99"),
        .target(
            name: "LinkNumpy",
            dependencies: ["libnumpy", "libnpymath", "libnpyrandom", "pyios"],
            linkerSettings: [.linkedFramework("Accelerate")]),
        .target(
            name: "NumPySupport",
            dependencies: ["pyios"],
            resources: [.copy("site-packages")]),
        .testTarget(
            name: "NumPy-iOSTests",
            dependencies: ["NumPySupport"]),
    ]
)
