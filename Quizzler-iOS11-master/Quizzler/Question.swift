//
//  Question.swift
//  Quizzler
//
//  Created by chityuen on 2017/11/5.
//  Copyright © 2017年 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}



