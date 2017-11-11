//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var scoreCount : Int = 0
    var count : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextQuestion()
        

        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        count += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(scoreCount)"
        progressLabel.text = "\(count+1)/13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(count + 1)
    }
    

    func nextQuestion() {
        
        if count < 13 {
            questionLabel.text = allQuestions.list[count].questionText
            updateUI()

        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        

    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[count].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            scoreCount += 1
            
        }
        else{
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    
    func startOver() {
        count = 0
        scoreCount = 0
        pickedAnswer = false
        nextQuestion()
    }
    

    
}
