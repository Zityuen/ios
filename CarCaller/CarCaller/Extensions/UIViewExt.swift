//
//  UIViewExt.swift
//  CarCaller
//
//  Created by chityuen on 12/22/17.
//  Copyright © 2017 chityuen. All rights reserved.
//

import UIKit

extension UIView{
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval){
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
    
//    func bindtoKeyboard(){
//        NotificationCenter.default.addObserver(self, selector: #selector(), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
//    }
//
//    func keyboardWillChange(_ notification: NSNotification){
//        let duration = notification.userInfo
//    }
    
}
