//
//  ViewController.swift
//  SheetPresentationController
//
//  Created by الياسي on 26/02/2022.
//

import UIKit

 
class ViewController: UIViewController{
    var timerTest = Timer()
     var time = 0
    
    @IBOutlet weak var buttonArched: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    open override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear ")
        buttonArched.setTitle("اسم دوله", for: .normal)
        }
    @IBAction func button(_ sender: UIButton) {
      let  storyboard = UIStoryboard(name: "SheetPresentationController", bundle: nil)
        let sheetPresenationController = storyboard.instantiateViewController(withIdentifier: "SheetPresentationControllerViewController") as! SheetPresentationControllerViewController
       present(sheetPresenationController, animated: true, completion: nil)
        timerTest = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(actionBundle), userInfo: nil, repeats: true)
    }
    @objc func actionBundle(){
        buttonArched.setTitle(nationality, for: .normal)
        if nationality != "" {
            stopTimerTest()
        }
               // stopTimerTest()
           
        
    }
    func stopTimerTest() {
      timerTest.invalidate()
     }
}

