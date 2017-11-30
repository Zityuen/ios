//
//  SecondViewController.swift
//  Segues
//
//  Created by chityuen on 2017/11/10.
//  Copyright © 2017年 chityuen. All rights reserved.
//

import UIKit

protocol CanReceive221 {
    func dataReceived221(data : String)
}

class SecondViewController: UIViewController {

    var textPassedOver : String?
    
    var delegate : CanReceive221?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = textPassedOver
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendBack(_ sender: UIButton) {
        delegate?.dataReceived221(data: textField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
