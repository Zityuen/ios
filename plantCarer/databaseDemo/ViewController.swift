//
//  ViewController.swift
//  databaseDemo
//
//  Created by chityuen on 11/29/17.
//  Copyright © 2017 chityuen. All rights reserved.
//

import UIKit
import Firebase
import Charts
import SVProgressHUD


class ViewController: UIViewController {

    
    
    


    var ref : DatabaseReference!
    var handle : DatabaseHandle!
//    var name : Double = 0.0
    var temperature:[Double] = []
    var moisture:[Double] = []
    var humidity:[Double] = []
    var days :[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func ButtonPressed(_ sender: UIButton) {
        if sender.tag == 1{
            performSegue(withIdentifier: "Soil", sender: self)
        }
        if sender.tag == 2{
            performSegue(withIdentifier: "Air", sender: self)
        }
        if sender.tag == 3{
            performSegue(withIdentifier: "Temp", sender: self)
        }
    }
    

    
}

