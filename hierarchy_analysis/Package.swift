import PackageDescription

let package = Package(
    name: "repro",
    targets: [
        Target(name: "Core"),
        Target(name: "Crash", dependencies: ["Core"])
    ]
)
