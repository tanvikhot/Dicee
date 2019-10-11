//
//  ViewController.swift
//  RollADice
//
//  Created by ShoCard Laptop on 10/2/19.
//  Copyright © 2019 Tanvi Khot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var count : Int = 6;
    var score : Int = 0;
    
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var rollsLeftLabelView: UILabel!
    @IBOutlet weak var gameStatusUILabel: UILabel!
    
    @IBOutlet weak var scoreLabelView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameStatusUILabel.text = ""
    }


    @IBAction func rollButtonPressed(_ sender: UIButton) {
   
        playGame()
    }
    
    func playGame() {
        count = count - 1;
        
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        print("randomDiceIndex1 = ",  randomDiceIndex1+1,  "       randomDiceIndex2 = ",  randomDiceIndex2+1 )
        
        score = score + (randomDiceIndex1+1) + (randomDiceIndex2+1);
        
        rollsLeftLabelView.text = String(count);
        scoreLabelView.text = String(score);
        
        
        if score >= 36 {
            let msg = "You Lost! You scored \(score) points in \(6 - count) number of rolls"
            self.gameStatusUILabel.text = "You Lost!!"
            showWinnerAlert(message: msg)
        }
        else if count == 0 && score < 36 {
            let msg:String = "You Won :) You scored \(score) points in 6 rolls"
            self.gameStatusUILabel.text = "You Won!!"
            showWinnerAlert(message: msg)
        }
        
    }
    
    func showWinnerAlert(message: String) {
        let alert = UIAlertController(title: message, message: "Lets play again", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.restartGame()
        }))
        
        self.present(alert, animated: true)
        
    }
    
    func restartGame() {
        count = 6
        score = 0
        
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        rollsLeftLabelView.text = String(count);
        scoreLabelView.text = String(score);
        
        self.gameStatusUILabel.text = " "
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        playGame()
    }
}

