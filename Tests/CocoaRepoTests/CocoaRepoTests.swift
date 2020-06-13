import XCTest
@testable import CocoaRepo

final class CocoaRepoTests: XCTestCase {

    
    func testColorRedColor() {
        let color = CocoaRepo.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedColor),
        
    ]
}
