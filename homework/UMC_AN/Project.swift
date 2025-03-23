import ProjectDescription

let project = Project(
    name: "UMC_AN",
    targets: [
        .target(
            name: "UMC_AN",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.UMC-AN",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["UMC_AN/Sources/**"],
            resources: ["UMC_AN/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "UMC_ANTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.UMC-ANTests",
            infoPlist: .default,
            sources: ["UMC_AN/Tests/**"],
            resources: [],
            dependencies: [.target(name: "UMC_AN")]
        ),
    ]
)
