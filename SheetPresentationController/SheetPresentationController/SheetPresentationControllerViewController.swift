//
//  SheetPresentationControllerViewController.swift
//  SheetPresentationController
//
//  Created by الياسي on 26/02/2022.
//

import UIKit

class SheetPresentationControllerViewController: UIViewController, UISheetPresentationControllerDelegate {
    var data = ["عمان", "الاماوات","اليمن","السعوديه","كويت","قطر","البحرين","العراق"]
    @IBOutlet weak var ITableView: UITableView!
    override var sheetPresentationController:UISheetPresentationController{
    presentationController as! UISheetPresentationController
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
      
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [.medium(),.large()]
    }
    

 

}
//VolunteerinitiativesCell
extension SheetPresentationControllerViewController:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
 
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.Label.text = data[indexPath.row]
        
        return cell
      
      
        }
       
}
