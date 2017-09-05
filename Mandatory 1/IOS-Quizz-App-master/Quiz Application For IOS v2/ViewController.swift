//
//  ViewController.swift
//  Quiz Application For IOS v2
//
//  Created by eak on 14/02/2017.
//  Copyright © 2017 eak. All rights reserved.
//

import UIKit

struct Question {
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
}

class ViewController: UIViewController {

    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var Points: UILabel!
    
    @IBOutlet var Buttons: [UIButton]!
    var Questions = [Question]()
    var QuestionNumber = Int()
    var AnswerNumber = Int()
    var pointsSystem = Int()
    
    var gameTimer = Timer()
    var gameTimerOff = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pointsSystem = 0
        
        Questions = [
            Question(Question: "What car is Casian's favorite car mark ?", Answers: ["Bmw","Alfa Romeo","Mercedes Benz","Lamborghini"], Answer: 1),
            Question(Question: "What kind of Alfa Romeo did Casian's father had ?", Answers: ["Alfetta","Giulietta 116","GTV","Spider"], Answer: 1),
            Question(Question: "What model dose Casian want's to buy in the future ?", Answers: ["Giulietta","Brerra","Giulia Quadrifoglio","Stelvio"], Answer: 2)
        ]
        PickQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func PickQuestion()
    {
        if Questions.count > 0 {
            QuestionNumber = 0
            QLabel.text = Questions[QuestionNumber].Question
            AnswerNumber = Questions[QuestionNumber].Answer
            
            for i in 0..<Buttons.count{
                Buttons[i].setTitle(Questions[QuestionNumber].Answers[i], for: UIControlState.normal)
            }
            Questions.remove(at: QuestionNumber)
        }else{
            let alert = UIAlertController(title: "Congratulations !!", message: "You had finished the quiz, your total of points were: \(pointsSystem)p", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Quit", style: UIAlertActionStyle.default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                exit(0)
            }))
            self.present(alert, animated: true, completion: nil)
            
            NSLog("DONE")
        }
    }
    @IBAction func Btn1(_ sender: Any) {
        if AnswerNumber == 0{
        PickQuestion()
        gameTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)
        pointsSystem = pointsSystem + 10
        Points.text = "Yes that question was right. -- Your score:\(pointsSystem)"
        }else{
            pointsSystem = pointsSystem - 2
            Points.text = "Opss that was a wrong answer pick another one. -- Your score:\(pointsSystem)"
        }
    }
    @IBAction func Btn2(_ sender: Any) {
        if AnswerNumber == 1{
            PickQuestion()
            pointsSystem = pointsSystem + 10
            Points.text = "Yes that question was right. -- Your score:\(pointsSystem)"
        }else{
            pointsSystem = pointsSystem - 2
            Points.text = "Opss that was a wrong answer pick another one. -- Your score:\(pointsSystem)"
        }
    }
    @IBAction func Btn3(_ sender: Any) {
        if AnswerNumber == 2{
            PickQuestion()
            pointsSystem = pointsSystem + 10
            Points.text = "Yes that question was right. -- Your score:\(pointsSystem)"
        }else{
            pointsSystem = pointsSystem - 2
            Points.text = "Opss that was a wrong answer pick another one. -- Your score:\(pointsSystem)"
        }
    }
    @IBAction func Btn4(_ sender: Any) {
        if AnswerNumber == 3{
            PickQuestion()
            pointsSystem = pointsSystem + 10
            Points.text = "Yes that question was right. -- Your score:\(pointsSystem)"
        }else{
            pointsSystem = pointsSystem - 2
            Points.text = "Opss that was a wrong answer pick another one. -- Your score:\(pointsSystem)"
        }
    }
    
    func runTimedCode(){
        gameTimerOff = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(offTime), userInfo: nil, repeats: false)
    }
    
    func offTime(){
    }
    
}

