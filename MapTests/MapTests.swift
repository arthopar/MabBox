//
//  MapTests.swift
//  MapTests
//
//  Created by Artak Tsatinyan on 1/14/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import XCTest
import XCTest
@testable import Map
import Core

class MockFieldsApiManager: FieldsApiManager {
    var mockData: Response<[Field]>

    public init (mockData: Response<[Field]>) {
        self.mockData = mockData
    }

    public func makeRequest(parameters: FieldsRouter, onCompletion: @escaping ((Response<[Field]>) -> Void)) {
        onCompletion(mockData)
    }
}

class MapTests: XCTestCase {
    var manager = MockFieldsApiManager(mockData: Response.success([Field()]))
    var viewModel: ViewModel?

    override func setUp() {
        viewModel = ViewModel(requestManager: manager)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_emptyData() {
        viewModel?.fetchList()

        XCTAssertNil(viewModel?.mapModels.value?.coordinates)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
