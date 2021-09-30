//
//  APIHelper.swift
//  20210929-PriyankaBandaru-NYCSchools
//
//  Created by Priyanka Bandaru on 9/29/21.
//

import Foundation

class APIHelper {
    
    //Function to retrieve the schools information from the given url.
    static func fetchNYUSchools(completionHandler: @escaping ([Schools]) -> Void) {
        var schoolsURL:String = ""
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let configValues = NSDictionary(contentsOfFile: path) {
                schoolsURL = configValues["schoolsURL"]  as! String
            }
        }
        let url = URL(string: schoolsURL)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching location weathers: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(String(describing: response))")
                      return
                  }
            if let data = data{
                let JSONfromschoolsapi = JSONHelper.getJSONFrom(data: data)
                var schools = [Schools]()
                if let response = JSONfromschoolsapi as? NSMutableArray{
                    for i in 0..<response.count{
                        var school = Schools()
                        if let schoolsDictionary = response[i] as? NSMutableDictionary{
                            school.dbn = schoolsDictionary.object(forKey:"dbn") as? String ?? ""
                            school.schoolName = schoolsDictionary.object(forKey:"school_name") as? String ?? ""
                            school.boro = schoolsDictionary.object(forKey: "boro") as? String ?? " "
                            school.overView = schoolsDictionary.object(forKey: "overview_paragraph") as? String ?? " "
                            school.phoneNumber = schoolsDictionary.object(forKey: "phone_number") as? String ?? " "
                            school.faxNumber = schoolsDictionary.object(forKey: "fax_number") as? String ?? " "
                            school.location = schoolsDictionary.object(forKey: "primary_address_line_1") as? String ?? " "
                            school.schoolEmail = schoolsDictionary.object(forKey: "school_email") as? String ?? " "
                        }
                        schools.append(school)
                    }
                    completionHandler(schools)
                }
            }
            
        })
        task.resume()
    }
    
    //Function to retrieve the sat scores for all the schools from the given url.
    static func fetchNYUSchoolSATScores(completionHandler: @escaping ([SATScores]) -> Void) {
        var schoolSATScoresURL:String = ""
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let configValues = NSDictionary(contentsOfFile: path) {
                schoolSATScoresURL = configValues["schoolSATScoresURL"]  as! String
            }
        }
        let url = URL(string: schoolSATScoresURL)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching location weathers: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(String(describing: response))")
                      return
                  }
            if let data = data{
                let JSONfromSATscoresapi = JSONHelper.getJSONFrom(data: data)
                var satScores = [SATScores]()
                if let response = JSONfromSATscoresapi as? NSMutableArray{
                    for i in 0..<response.count{
                        var satScore = SATScores()
                        if let satScoresDictionary = response[i] as? NSMutableDictionary{
                            satScore.school_name = satScoresDictionary.object(forKey:"school_name") as? String ?? ""
                            satScore.dbn = satScoresDictionary.object(forKey: "dbn") as? String ?? " "
                            satScore.num_of_sat_test_takers = Int(satScoresDictionary.object(forKey: "num_of_sat_test_takers") as? String ?? "")
                            satScore.sat_critical_reading_avg_score = Int(satScoresDictionary.object(forKey: "sat_critical_reading_avg_score") as?  String ?? "")
                            satScore.sat_math_avg_score = Int(satScoresDictionary.object(forKey: "sat_math_avg_score") as?  String ?? "")
                            satScore.sat_writing_avg_score = Int(satScoresDictionary.object(forKey: "sat_writing_avg_score") as?  String ?? "")
                        }
                        satScores.append(satScore)
                    }
                    completionHandler(satScores)
                }
            }
            
        })
        task.resume()
    }
}
