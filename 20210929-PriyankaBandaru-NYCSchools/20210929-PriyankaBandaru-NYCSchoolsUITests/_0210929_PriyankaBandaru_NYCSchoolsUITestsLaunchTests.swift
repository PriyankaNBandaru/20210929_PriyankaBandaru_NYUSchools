//
//  _0210929_PriyankaBandaru_NYCSchoolsUITestsLaunchTests.swift
//  20210929-PriyankaBandaru-NYCSchoolsUITests
//
//  Created by Priyanka Bandaru on 9/29/21.
//

import XCTest

class _0210929_PriyankaBandaru_NYCSchoolsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
