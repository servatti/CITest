//
//  CITestTests.swift
//  CITestTests
//
//  Created by Rafael Servatti on 8/16/16.
//  Copyright © 2016 Fera Solutions. All rights reserved.
//

import XCTest
@testable import CITest

class CITestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectation = expectationWithDescription("Request test")
        
        let url = NSURL(string: "http://md5.jsontest.com/?text=example_text")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            let result = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print(result)
            
            expectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectationsWithTimeout(60, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
