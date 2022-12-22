// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "MagickWand",
  products: [
    .library(
      name: "MagickWand",
      type: .static,
      targets: [
        "MagickWand"
      ]
    )
  ],
  targets: [
    .systemLibrary(
      name: "CMagickWand",
      // pkgConfig: "MagickWand-7.Q16HDRI",
      pkgConfig: "MagickWand-6.Q16",
      providers: [
        .brew(["imagemagick"]),
        .apt(["libmagickwand-6.q16-dev"]),
      ]
    ),
    .systemLibrary(
      name: "CMagickCore",
      // pkgConfig: "MagickCore-7.Q16HDRI",
      pkgConfig: "MagickCore-6.Q16",
      providers: [
        .brew(["imagemagick"]),
        .apt(["libmagickwand-6.q16-dev"]),
      ]
    ),
    .target(
      name: "MagickWand",
      dependencies: [
        "CMagickWand",
        "CMagickCore",
      ],
      cxxSettings: [
        .define("MAGICKCORE_HDRI_ENABLE", to: "0"),
        .define("MAGICKCORE_QUANTUM_DEPTH", to: "16"),
      ],
    ),
    .testTarget(
      name: "MagickWandTests",
      dependencies: ["MagickWand"]
    ),
  ]
)
