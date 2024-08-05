//
//  ViewController.swift
//  AddOne3
//
//  Created by Kolluru, Sri Harini on 12/8/23.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandom4()
        updateUI()
    }
    func generateRandom4(){
        let randomOne = Int.random(in: 0..<9)
        let randomTen = (Int.random(in: 0..<9))*10
        let randomHundred = (Int.random(in: 0..<9))*100
        let randomThousand = (Int.random(in: 1..<9))*1000
        random1 = randomThousand+randomHundred+randomTen+randomOne
        numberLabel.text = "\(random1)"
    }
    var random1 = 0000
    var timer = Timer()
    var runCount = 60
    var finalAnswer = 0
    var scoreNum = 0
    @IBOutlet weak var textEntered: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var Alert: UIButton!

    
    
    @IBAction func inputField(_ sender: Any) {
        guard textEntered.text!.count == 4 else{
            return
        }
        guard let newinputText = self.textEntered.text,  let answer = Int(newinputText)
        else { return }
        finalAnswer = answer
        print(finalAnswer)
        
        
        if finalAnswer == random1 + 1111
        {
            textEntered.text = ""
            generateRandom4()
            scoreNum += 1
            scoreLabel.text = "\(scoreNum)"
        }
        else{
            textEntered.text = ""
            generateRandom4()
            scoreNum -= 1
            scoreLabel.text = "\(scoreNum)"
        }
        
    }
    
    func updateUI()
    {
        scoreLabel.text = "0"
        timeLabel2.text = "60"
        runCount = 60
        timer=Timer.scheduledTimer(timeInterval:1.0, target:self,selector:#selector(timerFunction), userInfo:nil, repeats:true)
    }
    
    @IBAction func showAlertButtonTapped(_ sender: Any) {

            // create the alert
            let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)

            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
    }
   
    @objc func timerFunction(_ sender: Any) {
        timeLabel2.text = "\(runCount)"
        runCount = runCount - 1
        print(runCount)
        
        if runCount == 0 {
            timer.invalidate()
                let alert = UIAlertController(title: "Game Over", message: "Your score is \(scoreNum)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                    
                    self.updateUI()
                    
                }))
                // show the alert
                self.present(alert, animated: true, completion: nil)
             
        }
          
       
       
}
    
}
