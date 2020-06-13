import XCTest
@testable import CocoaRepo

final class CocoaColorTests: XCTestCase {

    
    func testColorRedColor() {
        let color = CocoaCore.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testCocoaColorsAreEqual() {
        let color = CocoaCore.Color.fromHexString("006736")
        XCTAssertEqual(color, CocoaCore.Color.cocoaColor)
    }
    
    func testSecondayColorAreEqual() {
        let color = CocoaCore.Color.fromHexString("FCFCFD")
        XCTAssertEqual(color, CocoaCore.Color.secondaryCocoColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedColor),
        ("testCocoaColorsAreEqual", testCocoaColorsAreEqual),
        ("testSecondayColorAreEqual", testSecondayColorAreEqual)
        
    ]
}
