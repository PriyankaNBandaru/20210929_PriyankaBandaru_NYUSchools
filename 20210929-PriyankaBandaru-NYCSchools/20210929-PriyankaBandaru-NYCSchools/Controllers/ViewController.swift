//
//  ViewController.swift
//  20210929-PriyankaBandaru-NYCSchools
//
//  Created by Priyanka Bandaru on 9/29/21.
//

import UIKit
private var schoolsList = [Schools]()
private var satScores = [SATScores]()
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "Schools Table View"
        // loading the Schools and Scores at the beginning of the app launch as the list wont update frequently.
        loadNYUSchools()
        loadSATScoresForSchools()
    }
    
    func loadNYUSchools(){
        APIHelper.fetchNYUSchools(completionHandler: { (schools) ->Void in
            schoolsList = schools
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    func loadSATScoresForSchools(){
        APIHelper.fetchNYUSchoolSATScores(completionHandler: { (satScore) ->Void in
            satScores = satScore
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolsIdentifier", for: indexPath) as! SchoolsTableViewCell
        let schoolData = schoolsList[indexPath.row]
        cell.accessibilityIdentifier = "Schools Table View Cell"
        cell.lblTitle?.text = schoolData.schoolName
        cell.accessibilityValue = schoolData.schoolName
        cell.lblLocation?.text = schoolData.location
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = schoolsList[indexPath.row]
        let satScoreForSchool = satScores.filter({$0.dbn == result.dbn})
        let hasScore = satScoreForSchool.count>0 ? true : false
        var popUpWindow: PopUpViewController!
        popUpWindow = PopUpViewController(satScoreForSchool:(satScoreForSchool.count>0) ? satScoreForSchool[0] : nil,schoolDetail:result,hasScores:hasScore)
        self.present(popUpWindow, animated: true, completion: nil)
    }
   
}

