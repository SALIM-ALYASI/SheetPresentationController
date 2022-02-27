//
//  Cell.swift
//  SheetPresentationController
//
//  Created by الياسي on 26/02/2022.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
