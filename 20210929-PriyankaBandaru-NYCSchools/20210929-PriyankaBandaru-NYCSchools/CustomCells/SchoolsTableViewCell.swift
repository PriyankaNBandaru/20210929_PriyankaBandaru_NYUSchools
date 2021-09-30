//
//  SchoolsTableViewCell.swift
//  Custom cell for the table view displaying list of schools.
//  20210929-PriyankaBandaru-NYCSchools
//
//  Created by Priyanka Bandaru on 9/29/21.
//

import UIKit

class SchoolsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}
