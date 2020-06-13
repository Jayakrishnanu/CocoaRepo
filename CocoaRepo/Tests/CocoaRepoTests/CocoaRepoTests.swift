import XCTest
@testable import CocoaRepo

final class CocoaRepoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CocoaRepo().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
