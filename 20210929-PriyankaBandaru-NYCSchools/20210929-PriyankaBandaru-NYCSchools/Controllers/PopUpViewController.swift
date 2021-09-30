//
//  PopUpViewController.swift
//  20210929-PriyankaBandaru-NYCSchools
//
//  Created by Priyanka Bandaru on 9/30/21.
//

import UIKit
import Foundation

class PopUpViewController: UIViewController {
    
    private let popUpWindowView = SchoolSATScoreView()
    
    //Initializing the pop up view controller by loading  the custom view created with more detailed information
    init(satScoreForSchool:SATScores?,schoolDetail:Schools,hasScores:Bool) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        popUpWindowView.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "lib.jpg")!)
        popUpWindowView.lblSchoolName?.text = schoolDetail.schoolName
        popUpWindowView.txtoverview?.text = schoolDetail.overView
        popUpWindowView.lbldbn?.text = schoolDetail.dbn
        popUpWindowView.lblBoro?.text = schoolDetail.boro
        popUpWindowView.lblPhoneNumber?.text = schoolDetail.phoneNumber
        popUpWindowView.lblFaxNumber?.text = schoolDetail.faxNumber
        popUpWindowView.lblLocation?.text = schoolDetail.location
        popUpWindowView.lblSchoolEmail?.text = schoolDetail.schoolEmail
        popUpWindowView.btnOk.setTitle("OK", for: .normal)
        popUpWindowView.btnOk.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        if hasScores {
            popUpWindowView.lblSatMathScore?.text =  String(satScoreForSchool!.sat_math_avg_score!)
            popUpWindowView.lblSatReadingScore?.text =  String(satScoreForSchool!.sat_critical_reading_avg_score!)
            popUpWindowView.lblSatWritingScore?.text =  String(satScoreForSchool!.sat_writing_avg_score!)
        }else{
            popUpWindowView.lblSatMathScore.isHidden = true
            popUpWindowView.lblSatWritingScore.isHidden = true
            popUpWindowView.lblSatReadingScore.isHidden = true
            popUpWindowView.lblMath.isHidden = true
            popUpWindowView.lblWriting.isHidden = true
            popUpWindowView.lblReading.isHidden = true
            
        }
        view = popUpWindowView
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
}
