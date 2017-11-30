//
//  ViewController.swift
//  Segues
//
//  Created by chityuen on 2017/11/10.
//  Copyright © 2017年 chityuen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive221 {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
    

    @IBAction func ButtonPressed2(_ sender: UIButton) {
        if sender.tag == 2{
            performSegue(withIdentifier: "goToThirdScreen", sender: self)
        }
        if sender.tag == 1 {
            performSegue(withIdentifier: "goToForthScreen", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen" {
            
            let secondVC = segue.destination as! SecondViewController
        
            secondVC.textPassedOver = textField.text!
            
            secondVC.delegate = self
            
            
        }
        if segue.identifier == "goToThirdScreen" {
            let thirdVC = segue.destination as! ThirdViewController
            
            thirdVC.text3 = textField.text
            
            thirdVC.delegate = self
        
        }
        if segue.identifier == "goToForthScreen" {
            let forthVC = segue.destination as! ForthViewController
            
            forthVC.text4 = textField.text
            
            forthVC.delegate = self
        }
    }
    
    func dataReceived221(data: String) {
        label.text = data
    }

}
