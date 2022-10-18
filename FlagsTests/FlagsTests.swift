//
//  FlagsTests.swift
//  FlagsTests
//
//  Created by Marcello on 17/10/22.
//


import XCTest
@testable import Flags

final class FlagsTests: XCTestCase {
    
    var apiService: ApiService?
    
    override func setUpWithError() throws {
        apiService = Container.shared.resolve(type: ApiService.self)
    }

    func testGetAllFlags() throws {
        
        let expectation = expectation(description: "receive async response")
        
        apiService?.getCountries { result in
            switch result{
            case .success(let data):
                XCTAssertNotNil(data)
                print("found \(data.count) items")
            case .failure(let error):
                XCTAssertNil(error, error.localizedDescription)
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 60) { error in
            if let error = error { XCTFail("waitForExpectationsWithTimeout errored: \(error)") }
        }
    }

}
