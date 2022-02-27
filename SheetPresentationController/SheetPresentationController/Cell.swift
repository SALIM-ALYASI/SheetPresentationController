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
class Viewo:  UIView {
    override func didMoveToWindow() {
            self.layer.cornerRadius = 10
            self.layer.shadowOpacity = 0.7
            self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.layer.shadowRadius = 15.0
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
            self.layer.borderWidth = 0.1
     }
}
