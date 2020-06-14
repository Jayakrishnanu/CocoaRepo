//
//  CocoaNetworking.swift
//  CocoaRepoTests
//
//  Created by Jayakrishnan u on 6/13/20.
//

import XCTest
@testable import CocoaRepo

class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
      completionHandler(data, error)
    }
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
    
    
}

struct MockData: Codable, Equatable {
    var id: Int
    var name: String
}


final class CocoaNetworking: XCTestCase {

    func testLoadDataCall() {
        let manager = CocoaCore.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
//        guard let url = URL(string: "https://google.com") else {
//            return XCTFail("Could not create URL properly.")
//        }
        
        let data = Data([0, 1, 0, 1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        let expectation = XCTestExpectation(description: "Called for data")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnData):
               //XCTAssertNotNil(returnData, "Response data is not nil")
                XCTAssertEqual(data, returnData, "Manager return data unexpected results")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error loading results")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func testSendDataCall() {
        let session = NetworkSessionMock()
        let manager = CocoaCore.Networking.Manager()
        let sampleObject = MockData(id: 1, name: "Jay")
        let data = try? JSONEncoder().encode(sampleObject)
        session.data = data
        manager.session = session
        let url = URL(fileURLWithPath: "url")
        let expectation = XCTestExpectation(description: "sent data")
        manager.sendData(to: url, body: sampleObject) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnData):
                let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnData)
                XCTAssertEqual(returnedObject, sampleObject)
                break
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error results")
            }
        }
        wait(for: [expectation], timeout: 5.0)
        
    }

    static var allTests = [
        ("testSendDataCall", testSendDataCall),
        ("testLoadDataCall", testLoadDataCall)
        ] 
 
}
