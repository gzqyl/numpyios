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
        .package(name: "Python-iOS", url: "https://github.com/gzqyl/pyios", .branch("master")),
    ],
    targets: [
        .binaryTarget(name: "libnumpy", url: "https://github.com/gzqyl/numpyios/releases/download/binaryxc/libnumpy.xcframework.zip", checksum: "99ae0916f33840cf9c97b423147e00c8ec5e0eb5e68d1a36731f230309d9d40c"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/gzqyl/numpyios/releases/download/binaryxc/libnpymath.xcframework.zip", checksum: "962737e93074862f41d48c127a243e19b1979a1949382ea7dc3746075739d8fc"),
        .binaryTarget(name: "libnpyrandom", url: "https://github.com/gzqyl/numpyios/releases/download/binaryxc/libnpyrandom.xcframework.zip", checksum: "11527be142959412b036b43cc4b93c8fea29802bb4652f1ce561e97c93bf0a99"),
        .target(
            name: "LinkNumpy",
            dependencies: ["libnumpy", "libnpymath", "libnpyrandom", "Python-iOS"],
            cSettings: [
                .headerSearchPath("./numpy"),
                .headerSearchPath("./numpy/libdivide"),
                .headerSearchPath("./numpy/random"),
                .headerSearchPath("./python3.11"),
                .headerSearchPath("./python3.11/cpython"),
                .headerSearchPath("./python3.11/internal"),
                .headerSearchPath("./openssl/crypto"),
                .headerSearchPath("./openssl/internal"),
                .headerSearchPath("./openssl/openssl"),
                .headerSearchPath("./ffi")
            ],
            linkerSettings: [.linkedFramework("Accelerate")]
        ),
        .target(
            name: "NumPySupport",
            dependencies: ["Python-iOS"],
            resources: [.copy("site-packages")],
            cSettings: [
                .headerSearchPath("./numpy"),
                .headerSearchPath("./numpy/libdivide"),
                .headerSearchPath("./numpy/random"),
                .headerSearchPath("./python3.11"),
                .headerSearchPath("./python3.11/cpython"),
                .headerSearchPath("./python3.11/internal"),
                .headerSearchPath("./openssl/crypto"),
                .headerSearchPath("./openssl/internal"),
                .headerSearchPath("./openssl/openssl"),
                .headerSearchPath("./ffi")
            ]
        ),
        .testTarget(
            name: "NumPy-iOSTests",
            dependencies: ["NumPySupport"],
            cSettings: [
                .headerSearchPath("./numpy"),
                .headerSearchPath("./numpy/libdivide"),
                .headerSearchPath("./numpy/random"),
                .headerSearchPath("./python3.11"),
                .headerSearchPath("./python3.11/cpython"),
                .headerSearchPath("./python3.11/internal"),
                .headerSearchPath("./openssl/crypto"),
                .headerSearchPath("./openssl/internal"),
                .headerSearchPath("./openssl/openssl"),
                .headerSearchPath("./ffi")
            ]
        ),
            
    ]
)
