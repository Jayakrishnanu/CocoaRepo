import XCTest
@testable import CocoaRepo

final class CocoaRepoTests: XCTestCase {

    
    func testColorRedColor() {
        let color = CocoaRepo.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testCocoaColorsAreEqual() {
        let color = CocoaRepo.colorFromHexString("006736")
        XCTAssertEqual(color, CocoaRepo.cocoaColor)
    }
    
    func testSecondayColorAreEqual() {
        let color = CocoaRepo.colorFromHexString("FCFCFD")
        XCTAssertEqual(color, CocoaRepo.secondaryCocoColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedColor),
        ("testCocoaColorsAreEqual", testCocoaColorsAreEqual),
        ("testSecondayColorAreEqual", testSecondayColorAreEqual)
        
    ]
}
