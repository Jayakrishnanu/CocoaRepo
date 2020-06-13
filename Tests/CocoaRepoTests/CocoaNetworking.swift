//
//  CocoaNetworking.swift
//  CocoaRepoTests
//
//  Created by Jayakrishnan u on 6/13/20.
//

import XCTest
@testable import CocoaRepo

final class CocoaNetworking: XCTestCase {

    func testLoadDataCall() {
        let manager = CocoaCore.Networking.Manager()
        guard let url = URL(string: "https://google.com") else {
            return XCTFail("Could not create URL properly.")
        }
        let expectation = XCTestExpectation(description: "Called for data")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnData):
                XCTAssertNotNil(returnData, "Response data is not nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error loading results")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    static var allTests = [
        ("testExample", testExample),
        ("testLoadDataCall", testLoadDataCall)
        ] 
 
}
