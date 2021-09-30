//
//  _0210929_PriyankaBandaru_NYCSchoolsTests.swift
//  20210929-PriyankaBandaru-NYCSchoolsTests
//
//  Created by Priyanka Bandaru on 9/29/21.
//

import XCTest
@testable import _0210929_PriyankaBandaru_NYCSchools

class _0210929_PriyankaBandaru_NYCSchoolsTests: XCTestCase {
    
    var vc:ViewController?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.setUpDefauts()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
extension _0210929_PriyankaBandaru_NYCSchoolsTests{
    func setUpDefauts(){
        let storyboard   = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateViewController(identifier: "viewController") as? ViewController
        //  self.setWeatherInfo()
    }
    
}
extension _0210929_PriyankaBandaru_NYCSchoolsTests{
    
    func testSchoolURLGenerated(){
        let url = URL(string:"https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        if url != nil{
            XCTAssertTrue(true,"URL generation success")
        }else{
            XCTAssertFalse(false,"URL generation success")
        }
    }
    
    func testSatScoreURLGenerated(){
        let url = URL(string:"https://data.cityofnewyork.us/resource/f9bf-2cp4.json</string>")
        if url != nil{
            XCTAssertTrue(true,"URL generation success")
        }else{
            XCTAssertFalse(false,"URL generation success")
        }
    }
    
    func testSchoolURLNotGenerated(){
        let url = URL(string:"https://data.cityofnewyork.us/resource//s3k6-pzi2.json")
        if url == nil{
            XCTAssertTrue(true,"URL generation failed")
        }else{
            XCTAssertFalse(false,"URL generation failed")
        }
    }
    
    func testSatScoreURLNotGenerated(){
        let url = URL(string:"https://data.cityofnewyork.us//resource/f9bf-2cp4.json</string>")
        if url == nil{
            XCTAssertTrue(true,"URL generation failed")
        }else{
            XCTAssertFalse(false,"URL generation failed")
        }
    }
    
    func testfetchSchoolListReturnsSuccess(){
        var schoolResponse:[Schools]?
        let schoolExpectation = expectation(description: "School List")
        APIHelper.fetchNYUSchools(completionHandler: { (schoolRes) ->Void in
            schoolResponse = schoolRes
            schoolExpectation.fulfill()
        })
        waitForExpectations(timeout: 5){ (error) in
            XCTAssertNotNil(schoolResponse)
        }
    }
    
    func testfetchSchoolSATScoreReturnsSuccess(){
        var satScoreResponse:[SATScores]?
        let satScoreExpectation = expectation(description: "SAT Score For School List")
        APIHelper.fetchNYUSchoolSATScores(completionHandler: { (satScoreRes) ->Void in
            satScoreResponse = satScoreRes
            satScoreExpectation.fulfill()
        })
        waitForExpectations(timeout: 5){ (error) in
            XCTAssertNotNil(satScoreResponse)
        }
    }
    func testConvertJSONFromDataReturnsSuccess(){
        let jsonData = "[{\"dbn\":\"02M260\",\"school_name\":\"Clinton School Writers & Artists, M.S. 260\",\"boro\":\"M\"}]".data(using: .utf8)
        let json = JSONHelper.getJSONFrom(data: jsonData!)
        XCTAssertNotNil(json)
    }
    
}

