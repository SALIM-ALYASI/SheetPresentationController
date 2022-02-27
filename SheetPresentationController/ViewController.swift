//
//  ViewController.swift
//  SheetPresentationController
//
//  Created by الياسي on 26/02/2022.
//

import UIKit

@available(iOS 15.0, *)
class ViewController: UIViewController{ 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: UIButton) {
      let  storyboard = UIStoryboard(name: "SheetPresentationController", bundle: nil)
        let sheetPresenationController = storyboard.instantiateViewController(withIdentifier: "SheetPresentationControllerViewController") as! SheetPresentationControllerViewController
       present(sheetPresenationController, animated: true, completion: nil)
    }
    
}

