//
//  HomeVC.swift
//  CarCaller
//
//  Created by chityuen on 12/20/17.
//  Copyright © 2017 chityuen. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var makView: MKMapView!
    @IBOutlet weak var actionBtn: RoundedShadowButton!
    @IBOutlet weak var ReqLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makView.delegate = self
    }

    @IBAction func BtnPressed(_ sender: Any) {
        
//        self.actionBtn.setTitle("22", for: .normal)
        ReqLabel.isHidden = true
        actionBtn.animateButton(shouldLoad: true, withMessage: nil)
    }
}


