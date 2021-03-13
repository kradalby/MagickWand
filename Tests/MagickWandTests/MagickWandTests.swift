import Foundation
import XCTest
@testable import MagickWand

class MagickWandTests: XCTestCase {

    func testGenesisTerminus() {
        XCTAssertFalse(MagickWand.isInstantiated)

        MagickWand.genesis()

        XCTAssertTrue(MagickWand.isInstantiated)

        MagickWand.terminus()

        XCTAssertFalse(MagickWand.isInstantiated)
    }

    func testWandVersion() {
        MagickWand.genesis()
        defer { MagickWand.terminus() }

        XCTAssertTrue(MagickWand.version.hasPrefix("ImageMagick 6"), "Actial version is \(MagickWand.version)")
    }

    static var allTests: [(String, (MagickWandTests) -> () throws -> Void)] {
        return [
            ("Magick Wand - Genesis and Terminus", testGenesisTerminus),
            ("Magick Wand - Version", testWandVersion)
        ]
    }
}
