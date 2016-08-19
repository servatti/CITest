//
//  CITestUITests.swift
//  CITestUITests
//
//  Created by Rafael Servatti on 8/16/16.
//  Copyright © 2016 Fera Solutions. All rights reserved.
//

import XCTest

class CITestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        NSThread.sleepForTimeInterval(2)

        let app = XCUIApplication()
        app.buttons["button"].tap()
        
//        XCTAssertTrue(app.staticTexts["label"].label.containsString("md5"))
        
        waitForStaticTextOn(app.staticTexts["label"], equalsVariable: "md5", waitSeconds: 60)
        
        XCTAssertTrue(app.staticTexts["label111"].exists)
        
    }

    
    func waitForStaticTextOn(element: XCUIElement, equalsVariable: String, waitSeconds: Double, file: String = #file, line: UInt = #line)
    {
        let existsPredicate = NSPredicate(format: "label contains %@", equalsVariable)
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
        waitForExpectationsWithTimeout(waitSeconds) { (error) -> Void in
            if (error != nil)
            {
                let message = "Failed to find \(element) after \(waitSeconds) seconds."
                self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    
}
