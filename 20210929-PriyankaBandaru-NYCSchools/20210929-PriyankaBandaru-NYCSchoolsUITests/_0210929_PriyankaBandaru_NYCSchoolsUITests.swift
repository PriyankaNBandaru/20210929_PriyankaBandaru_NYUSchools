//
//  _0210929_PriyankaBandaru_NYCSchoolsUITests.swift
//  20210929-PriyankaBandaru-NYCSchoolsUITests
//
//    Can write a multiple UI test cases to test the existence of  labels
//    and values in the pop up view controller.Since i have time of 2 days,I
//    implemented a couple of test cases.
//
//
//  Created by Priyanka Bandaru on 9/29/21.
//

import XCTest

class _0210929_PriyankaBandaru_NYCSchoolsUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
        app.terminate()
    }
    
    func testLabelAppValueExists() throws {
        app.launch()
        XCTAssertEqual(app.staticTexts.element(matching:     .any,identifier:" App Title").label,"NYU Schools")
        app.terminate()
    }
    func testLabelAppExists() throws {
        app.launch()
        let isAppLabelDisplayed = app.staticTexts[" App Title"].exists
        XCTAssertTrue(isAppLabelDisplayed)
        app.terminate()
    }
    
    func testTableViewExists() throws{
        app.launch()
        let isTableViewVisible = app.tables["Schools Table View"].exists
        XCTAssertTrue(isTableViewVisible)
        app.terminate()
    }
    
    func testTableViewCellExists() throws {
        app.launch()
        let isCellDisplayed = app.tables["Schools Table View"].cells["Schools Table View Cell"].exists
        sleep(1)
        XCTAssertTrue(isCellDisplayed)
        app.terminate()
    }
}
