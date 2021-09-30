//
//  SchoolSATScoreView.swift
//  20210929-PriyankaBandaru-NYCSchools
//
//   Custom view to display the School information and their respective
//   SAT Scores if available.
//
//  Created by Priyanka Bandaru on 9/29/21.
//

import UIKit

class SchoolSATScoreView: UIView {

    @IBOutlet weak var lblWriting: UILabel!
    @IBOutlet weak var lblReading: UILabel!
    @IBOutlet weak var lblMath: UILabel!
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblSchoolOverview: UILabel!
    @IBOutlet weak var lblSatWritingScore: UILabel!
    @IBOutlet weak var lblSatReadingScore: UILabel!
    @IBOutlet weak var lblFaxNumber: UILabel!
    @IBOutlet weak var lbldbn: UILabel!
    @IBOutlet weak var lblBoro: UILabel!
    @IBOutlet weak var txtoverview: UITextView!
    @IBOutlet weak var lblSatMathScore: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblSchoolEmail: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet var contentView: UIView!
    /*
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
            initSubviews()
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            initSubviews()
        }

        func initSubviews() {
            // standard initialization logic
            let nib = UINib(nibName: "SchoolSATScoreView", bundle: nil)
            nib.instantiate(withOwner: self, options: nil)
            contentView.frame = bounds
            addSubview(contentView)
        }

}
