import PackageDescription

let package = Package(
    name: "swift-typecheck-crash-reproducer",
    targets: [
        Target(name: "Core"),
        Target(name: "Crash", dependencies: ["Core"])
    ]
)
