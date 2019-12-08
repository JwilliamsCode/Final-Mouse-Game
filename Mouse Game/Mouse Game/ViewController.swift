//
//  ViewController.swift
//  Mouse Game
//
//  Created by Justin Williams on 11/21/19.
//  Copyright © 2019 Justin Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameRunning = false
    var hits = 0
    var counterOne = 0
    var counterTwo = 0
    var counterThree = 0
    var counterFour = 0
    var counterFive = 0
    var counterSix = 0
    var pointsEarned = 0
    var hintCounterOne = 0
    var hintCounterTwo = 0
    var totalScore = 0
    var highScore = 0
    var randomNumber = 0
    var randomNumberStinkyOne = 0
    var randomNumberStinkyTwo = 0
    var randomNumberStinkyThree = 0
    
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var btnReveal: UIButton!
    @IBOutlet weak var btnHint: UIButton!
    @IBOutlet weak var holeOne: UIButton!
    @IBOutlet weak var holeTwo: UIButton!
    @IBOutlet weak var holeThree: UIButton!
    @IBOutlet weak var holeFour: UIButton!
    @IBOutlet weak var holeFive: UIButton!
    @IBOutlet weak var holeSix: UIButton!
    @IBOutlet weak var lblHoleOne: UILabel!
    @IBOutlet weak var lblHoleTwo: UILabel!
    @IBOutlet weak var lblHoleThree: UILabel!
    @IBOutlet weak var lblHoleFour: UILabel!
    @IBOutlet weak var lblHoleFive: UILabel!
    @IBOutlet weak var lblHoleSix: UILabel!
    @IBOutlet weak var lblRules: UILabel!
    @IBOutlet weak var lblHint: UILabel!
    @IBOutlet weak var lblTScore: UILabel!
    @IBOutlet weak var lblTotalScore: UILabel!
    @IBOutlet weak var lblHScore: UILabel!
    @IBOutlet weak var lblHighScore: UILabel!
    @IBOutlet weak var lblOutcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblOutcome.alpha = 0.0
        holeOne.isUserInteractionEnabled = false
        holeTwo.isUserInteractionEnabled = false
        holeThree.isUserInteractionEnabled = false
        holeFour.isUserInteractionEnabled = false
        holeFive.isUserInteractionEnabled = false
        holeSix.isUserInteractionEnabled = false
        
        lblHighScore.layer.masksToBounds = true
        lblHScore.layer.masksToBounds = true
        lblTotalScore.layer.masksToBounds = true
        lblTScore.layer.masksToBounds = true
        lblHint.layer.masksToBounds = true
        lblHoleOne.layer.masksToBounds = true
        lblHoleTwo.layer.masksToBounds = true
        lblHoleThree.layer.masksToBounds = true
        lblHoleFour.layer.masksToBounds = true
        lblHoleFive.layer.masksToBounds = true
        lblHoleSix.layer.masksToBounds = true
        lblOutcome.layer.masksToBounds = true
        lblRules.layer.masksToBounds = true
        
        btnStart.layer.cornerRadius = btnStart.frame.height / 2
        btnReset.layer.cornerRadius = btnStart.frame.height / 2
        btnReveal.layer.cornerRadius = btnStart.frame.height / 2
        btnHint.layer.cornerRadius = btnStart.frame.height / 2
        lblRules.layer.cornerRadius = 10
        lblOutcome.layer.cornerRadius = 10
        lblOutcome.backgroundColor = UIColor.white
        lblHoleOne.layer.cornerRadius = 10
        lblHoleTwo.layer.cornerRadius = 10
        lblHoleThree.layer.cornerRadius = 10
        lblHoleFour.layer.cornerRadius = 10
        lblHoleFive.layer.cornerRadius = 10
        lblHoleSix.layer.cornerRadius = 10
        lblHighScore.layer.cornerRadius = 10
        lblTotalScore.layer.cornerRadius = 10
        lblTScore.layer.cornerRadius = 15
        lblTScore.backgroundColor = UIColor.universalGray
        lblHScore.layer.cornerRadius = 15
        lblHScore.backgroundColor = UIColor.universalGray
        lblHint.layer.cornerRadius = lblHint.frame.height / 2
        
        btnStart.layer.shadowColor = UIColor.black.cgColor
        btnStart.layer.shadowRadius = 2
        btnStart.layer.shadowOpacity = 0.5
        btnStart.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        btnReset.layer.shadowColor = UIColor.black.cgColor
        btnReset.layer.shadowRadius = 2
        btnReset.layer.shadowOpacity = 0.5
        btnReset.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        btnReveal.layer.shadowColor = UIColor.black.cgColor
        btnReveal.layer.shadowRadius = 2
        btnReveal.layer.shadowOpacity = 0.5
        btnReveal.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        btnHint.layer.shadowColor = UIColor.black.cgColor
        btnHint.layer.shadowRadius = 2
        btnHint.layer.shadowOpacity = 0.5
        btnHint.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        lblHighScore.layer.shadowColor = UIColor.black.cgColor
        lblHighScore.layer.shadowRadius = 2
        lblHighScore.layer.shadowOpacity = 0.5
        lblHighScore.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        // UI Button Colors
        btnStart.backgroundColor = UIColor.universalGreen
        btnReset.backgroundColor = UIColor.universalRed
        btnReveal.backgroundColor = UIColor.universalBlue
        btnHint.backgroundColor = UIColor.universalBlue
    }
    
    @IBAction func btnStartPressed(_ sender: Any) {
        lblHint.alpha = 0.0
        lblOutcome.alpha = 0.0
        lblRules.isHidden = false
        btnStart.backgroundColor = UIColor.universalDeepGreen
        btnReset.backgroundColor = UIColor.universalRed
        btnReveal.backgroundColor = UIColor.universalBlue
        btnHint.backgroundColor = UIColor.universalBlue
        
        hits = 0

        // Generates random numbers 1-5 for the mouse and two stinky cheese
        randomNumber = Int.random(in: 1..<6)
        randomNumberStinkyOne = Int.random(in: 1..<7)
        randomNumberStinkyTwo = Int.random(in: 1..<7)
        randomNumberStinkyThree = Int.random(in: 1..<7)
    
        // While the first stinky cheese randoms a number equal to the mouse it will keep random generating a number
        // until the stinky cheese does not share the same picturebox with the mouse
        while randomNumberStinkyOne == randomNumber {
            randomNumber = Int.random(in: 1..<7)
            
            if randomNumberStinkyOne != randomNumber {
                break
            }
        }
        
        /* While the second stinky cheese is equal to the first or the mouse it will keep randomly generating a number
            until the second stinky chees does not share the same picturebox with the first or the mouse */
        while randomNumberStinkyTwo == randomNumberStinkyOne || randomNumberStinkyTwo == randomNumber {
            randomNumberStinkyTwo = Int.random(in: 1..<7)
        }
        
        while randomNumberStinkyThree == randomNumberStinkyTwo || randomNumberStinkyThree == randomNumberStinkyOne || randomNumberStinkyThree == randomNumber {
            randomNumberStinkyThree = Int.random(in: 1..<7)
        }
        
        // Display the mouse hole for all 5 holes image
        holeOne.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeTwo.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeThree.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeFour.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeFive.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeSix.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        
        // Enable each button
        holeOne.isUserInteractionEnabled = true
        holeTwo.isUserInteractionEnabled = true
        holeThree.isUserInteractionEnabled = true
        holeFour.isUserInteractionEnabled = true
        holeFive.isUserInteractionEnabled = true
        holeSix.isUserInteractionEnabled = true
        
        // Enables Hole labels per each hole for start of each game
        lblHoleOne.text = "Hole 1"
        lblHoleOne.isHidden = false
        
        lblHoleTwo.text = "Hole 2"
        lblHoleTwo.isHidden = false
    
        lblHoleThree.text = "Hole 3"
        lblHoleThree.isHidden = false
        
        lblHoleFour.text = "Hole 4"
        lblHoleFour.isHidden = false
        
        lblHoleFive.text = "Hole 5"
        lblHoleFive.isHidden = false
        
        lblHoleSix.text = "Hole 6"
        lblHoleSix.isHidden = false
        
        // Sets the hint text to nothing
        lblHint.text = ""
        lblOutcome.text = ""
        
        // The start button resets the amount of total clicks that the game has registered so it can be played again
        hits = 0
        
        /* The start button resets the times each button is recorded as being clicked to 0 again
        so the hits variable ( user clicks) knows it the player has lost or won
        Also, sets the hint button clicks to 0 */
        counterOne = 0
        counterTwo = 0
        counterThree = 0
        counterFour = 0
        counterFive = 0
        counterSix = 0
        pointsEarned = 0
        hintCounterOne = 0
        hintCounterTwo = 0
        
        // Sets the gameRunning variable to 'True' signaling the start of the game
        gameRunning = true
    }
    
    @IBAction func btnResetPressed(_ sender: Any) {
        lblHint.alpha = 0.0
        lblOutcome.alpha = 0.0
        btnStart.backgroundColor = UIColor.universalGreen
        btnReset.backgroundColor = UIColor.universalDeepRed
        btnReveal.backgroundColor = UIColor.universalBlue
        btnHint.backgroundColor = UIColor.universalBlue
        
        // Display the "Is the mouse here?" image
        holeOne.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeTwo.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeThree.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeFour.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeFive.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        holeSix.setImage(UIImage(named:"Hole2.png"), for: UIControl.State.normal)
        
        // Make buttons unclickable
        holeOne.isUserInteractionEnabled = false
        holeTwo.isUserInteractionEnabled = false
        holeThree.isUserInteractionEnabled = false
        holeFour.isUserInteractionEnabled = false
        holeFive.isUserInteractionEnabled = false
        holeSix.isUserInteractionEnabled = false
        
        // Enables Hole labels per each hole for start of each game
        lblHoleOne.text = "Hole 1"
        lblHoleOne.isHidden = false
        
        lblHoleTwo.text = "Hole 2"
        lblHoleTwo.isHidden = false
        
        lblHoleThree.text = "Hole 3"
        lblHoleThree.isHidden = false
        
        lblHoleFour.text = "Hole 4"
        lblHoleFour.isHidden = false
        
        lblHoleFive.text = "Hole 5"
        lblHoleFive.isHidden = false
        
        lblHoleSix.text = "Hole 6"
        lblHoleSix.isHidden = false
        
        // Sets hint text to nothing
        lblHint.text = ""
        lblOutcome.text = ""
        
        // Sets the score variables and visual display to 0
        hits = 0
        totalScore = 0
        highScore = 0
        lblHighScore.text = String(highScore)
        lblTotalScore.text = String(totalScore)
    }
    
    @IBAction func btnRevealPressed(_ sender: Any) {
        
        //If the game is over but it had at one time
        if gameRunning == false && hits > 0 {
        
            btnStart.backgroundColor = UIColor.universalGreen
            btnReset.backgroundColor = UIColor.universalRed
            btnReveal.backgroundColor = UIColor.universalDeepBlue
            btnHint.backgroundColor = UIColor.universalBlue
            
            // Make buttons unclickable
            holeOne.isUserInteractionEnabled = false
            holeTwo.isUserInteractionEnabled = false
            holeThree.isUserInteractionEnabled = false
            holeFour.isUserInteractionEnabled = false
            holeFive.isUserInteractionEnabled = false
            holeSix.isUserInteractionEnabled = false
            
            // Sets all label texts to nothing and makes them invisible
            lblHoleOne.text = ""
            lblHoleOne.isHidden = true
        
            lblHoleTwo.text = ""
            lblHoleTwo.isHidden = true
        
            lblHoleThree.text = ""
            lblHoleThree.isHidden = true
        
            lblHoleFour.text = ""
            lblHoleFour.isHidden = true
        
            lblHoleFive.text = ""
            lblHoleFive.isHidden = true
        
            lblHoleSix.text = ""
            lblHoleSix.isHidden = true
            
            // Sets all pictures boxes to delicious cheese so the program can change the two stinky cheese and the mouse picture box
            // without worrying about the delicious cheese
            holeOne.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
            holeTwo.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
            holeThree.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
            holeFour.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
            holeFive.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
            holeSix.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
            
            // Finds the mouse and displays it's picture
            if randomNumber == 1 {
                holeOne.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            }
            else if randomNumber == 2 {
                holeTwo.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            }
            else if randomNumber == 3 {
                holeThree.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            }
            else if randomNumber == 4 {
                holeFour.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            }
            else if randomNumber == 5 {
                holeFive.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            }
            else if randomNumber == 6 {
                holeSix.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            }
        
            // Finds one of the stinky cheese and displays it
            if randomNumberStinkyOne == 1 {
                holeOne.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyOne == 2 {
                holeTwo.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyOne == 3 {
                holeThree.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyOne == 4 {
                holeFour.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyOne == 5 {
                holeFive.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyOne == 6 {
                holeSix.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
        
            // Finds the second stinky cheese and displays it
            if randomNumberStinkyTwo == 1 {
                holeOne.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyTwo == 2 {
                holeTwo.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyTwo == 3 {
                holeThree.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyTwo == 4 {
                holeFour.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyTwo == 5 {
                holeFive.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyTwo == 6 {
                holeSix.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            
            // Finds the third sinky cheese
            if randomNumberStinkyThree == 1 {
                holeOne.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyThree == 2 {
                holeTwo.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyThree == 3 {
                holeThree.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyThree == 4 {
                holeFour.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyThree == 5 {
                holeFive.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
            else if randomNumberStinkyThree == 6 {
                holeSix.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
            }
        }
    }
    
    @IBAction func btnHintPressed(_ sender: Any) {
        
        if hintCounterOne == 0 {
            lblHint.alpha = 1.0
            lblHint.backgroundColor = UIColor.universalBlue
            lblHint.text = "  You need to find delicious cheese to unlock a hint!"
        }
        //Activates the second hint after two delicious cheese have been found
        if hintCounterOne == 2 {
            hintCounterTwo = 1
        }
        
        // If one delicious cheese is found it gives a hint based on if the mouse is in an even or odd number hole
        if hintCounterOne == 1 {
            if randomNumber % 2 != 0 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    Try checking one of the odd number holes"
            }
        else if randomNumber % 2 == 0 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    Try checking one of the even number holes"
                
            }
        }
        
        // If two delicious cheese have been found it gives a difinitive answer on where 1 stinky cheese is
        if hintCounterTwo == 1 {
            if randomNumberStinkyOne == 1 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    There is something smelly inside hole 1"
            }
            else if randomNumberStinkyOne == 2 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    There is something smelly inside hole 2"
            }
            else if randomNumberStinkyOne == 3 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    There is something smelly inside hole 3"
            }
            else if randomNumberStinkyOne == 4 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    There is something smelly inside hole 4"
            }
            else if randomNumberStinkyOne == 5 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    There is something smelly inside hole 5"
            }
            else if randomNumberStinkyOne == 6 {
                lblHint.alpha = 1.0
                lblHint.backgroundColor = UIColor.universalBlue
                lblHint.text = "    There is something smelly inside hole 6"
            }
        }
        
    }
    
    @IBAction func holeOnePressed(_ sender: Any) {
        
        // If the game is running and the first picture is clicked it increments the button click by 1
        if gameRunning == true {
            if counterOne < 1 {
                hits += 1
                counterOne += 1
            }
        }
        
        // If the game is over then this button is shut off
        if gameRunning == false {
            holeOne.isUserInteractionEnabled = false
        }
        
        // Determines if the mouse is hiding inside this hole, if it is.. it will change the image to the mouse, make the game text info not visible,
        // signal that the game is over, and calculate / display how many points were earned for winning depending on how many turns were used
        else if randomNumber == 1 {
            holeOne.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            lblHoleOne.isHidden = true
            lblRules.isHidden = true
            lblOutcome.alpha = 1.0
            gameRunning = false
        
            if hits == 1 {
                totalScore = totalScore + 30
                lblTotalScore.text = String(totalScore)
                
                pointsEarned = 30
                lblOutcome.text = "Congratulations!  You won 30 points!"
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
            else if hits == 2 {
                totalScore = totalScore + 20
                lblTotalScore.text = String(totalScore)
                
                pointsEarned = 20
                lblOutcome.text = "Congratulations!  You won 20 points!"
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
            else if hits == 3 {
                totalScore = totalScore + 10
                lblTotalScore.text = String(totalScore)
                
                pointsEarned = 10
                lblOutcome.text = "Congratulations!  You won 10 points!"
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }

            // if game is running it will determine if there is one of the stinky cheese inside this hole, it will change the image, make the game text info not visible
            // signal that the game is over, and calculate / display how many points are lost depending on how many turns were used (score can not go negative)
        }
        else if gameRunning == true {
            if randomNumberStinkyOne == 1 || randomNumberStinkyTwo == 1 {
                holeOne.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                lblHoleOne.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
        
                holeOne.isUserInteractionEnabled = false
                holeTwo.isUserInteractionEnabled = false
                holeThree.isUserInteractionEnabled = false
                holeFour.isUserInteractionEnabled = false
                holeFive.isUserInteractionEnabled = false
                holeSix.isUserInteractionEnabled = false
                    
                if hits == 1 {
                    if totalScore >= 15 {
                        totalScore = totalScore - 15
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 15 points!"
                        pointsEarned = 15
                    }
                }
                else if hits == 2 {
                    if totalScore >= 10 {
                        totalScore = totalScore - 10
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 10 points!"
                        pointsEarned = 10
                    }
                }
                else if hits == 3 {
                    if totalScore >= 5 {
                        totalScore = totalScore - 5
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 5 points!"
                        pointsEarned = 5
                    }
                }
            }
            else if randomNumberStinkyThree == 1 {
                holeOne.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                lblHoleOne.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
                       
                holeOne.isUserInteractionEnabled = false
                holeTwo.isUserInteractionEnabled = false
                holeThree.isUserInteractionEnabled = false
                holeFour.isUserInteractionEnabled = false
                holeFive.isUserInteractionEnabled = false
                holeSix.isUserInteractionEnabled = false
                                   
                if hits == 1 {
                    if totalScore >= 15 {
                        totalScore = totalScore - 15
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 15 points!"
                        pointsEarned = 15
                    }
                }
                else if hits == 2 {
                    if totalScore >= 10 {
                        totalScore = totalScore - 10
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 10 points!"
                        pointsEarned = 10
                    }
                }
                else if hits == 3 {
                    if totalScore >= 5 {
                        totalScore = totalScore - 5
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 5 points!"
                        pointsEarned = 5
                    }
                }
            }
        
            // This assumes the hole doesn't have a mouse or stinky cheese so it has a delicious cheese
            // it sets the picture to delicious cheese, makes the label not visible, increments the hint counter so
            // the user can use a hint and makes the hint button light up green
            else {
                holeOne.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
                lblHoleOne.isHidden = true
                lblHoleOne.isUserInteractionEnabled = false
                hintCounterOne += 1
                btnHint.backgroundColor = UIColor.universalDeepBlue
            }
        }

    }
        
    @IBAction func holeTwoPressed(_ sender: Any) {
        // If the game is running and the first picture is clicked it increments the button click by 1
        if gameRunning == true {
            if counterTwo < 1 {
                hits += 1
                counterTwo += 1
            }
        }
            
        // If the game is over then this button is shut off
        if gameRunning == false {
            holeTwo.isUserInteractionEnabled = false
        }
            
        // Determines if the mouse is hiding inside this hole, if it is.. it will change the image to the mouse, make the game text info not visible,
        // signal that the game is over, and calculate / display how many points were earned for winning depending on how many turns were used
        else if randomNumber == 2 {
            holeTwo.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            lblHoleTwo.isHidden = true
            lblRules.isHidden = true
            lblOutcome.alpha = 1.0
            gameRunning = false
            
            if hits == 1 {
                totalScore = totalScore + 30
                lblTotalScore.text = String(totalScore)
                
                lblOutcome.text = "Congratulations!  You won 30 points!"
                pointsEarned = 30
                
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
            else if hits == 2 {
                totalScore = totalScore + 20
                lblTotalScore.text = String(totalScore)
                
                lblOutcome.text = "Congratulations!  You won 20 points!"
                pointsEarned = 20
                
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
            else if hits == 3 {
                totalScore = totalScore + 10
                lblTotalScore.text = String(totalScore)
                
                lblOutcome.text = "Congratulations!  You won 10 points!"
                pointsEarned = 10
                
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
            
                // if game is running it will determine if there is one of the stinky cheese inside this hole, it will change the image, make the game text info not visible
                // signal that the game is over, and calculate / display how many points are lost depending on how many turns were used (score can not go negative)
        }
        else if gameRunning == true {
            if randomNumberStinkyOne == 2 || randomNumberStinkyTwo == 2 {
                holeTwo.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                lblHoleTwo.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
            
                holeOne.isUserInteractionEnabled = false
                holeTwo.isUserInteractionEnabled = false
                holeThree.isUserInteractionEnabled = false
                holeFour.isUserInteractionEnabled = false
                holeFive.isUserInteractionEnabled = false
                holeSix.isUserInteractionEnabled = false
                    
                if hits == 1 {
                    if totalScore >= 15 {
                        totalScore = totalScore - 15
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 15 points!"
                        pointsEarned = 15
                    }
                }
                else if hits == 2 {
                    if totalScore >= 10 {
                        totalScore = totalScore - 10
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 10 points!"
                        pointsEarned = 10
                    }
                }
                else if hits == 3 {
                    if totalScore >= 5 {
                        totalScore = totalScore - 5
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 5 points!"
                        pointsEarned = 5
                    }
                }
            }
            else if randomNumberStinkyThree == 2 {
                holeTwo.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                lblHoleTwo.isHidden = true
                lblOutcome.alpha = 1.0
                lblRules.isHidden = true
                gameRunning = false
            
                holeOne.isUserInteractionEnabled = false
                holeTwo.isUserInteractionEnabled = false
                holeThree.isUserInteractionEnabled = false
                holeFour.isUserInteractionEnabled = false
                holeFive.isUserInteractionEnabled = false
                holeSix.isUserInteractionEnabled = false
                    
                if hits == 1 {
                    if totalScore >= 15 {
                        totalScore = totalScore - 15
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 15 points!"
                        pointsEarned = 15
                    }
                }
                else if hits == 2 {
                    if totalScore >= 10 {
                        totalScore = totalScore - 10
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 10 points!"
                        pointsEarned = 10
                    }
                }
                else if hits == 3 {
                    if totalScore >= 5 {
                        totalScore = totalScore - 5
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 5 points!"
                        pointsEarned = 5
                    }
                }
            }
                
            // This assumes the hole doesn't have a mouse or stinky cheese so it has a delicious cheese
            // it sets the picture to delicious cheese, makes the label not visible, increments the hint counter so
            // the user can use a hint and makes the hint button light up green
            else {
                holeTwo.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
                lblHoleTwo.isHidden = true
                lblHoleTwo.isUserInteractionEnabled = false
                hintCounterOne += 1
                btnHint.backgroundColor = UIColor.universalDeepBlue
            }
        }

    }
    
    @IBAction func holeThreePressed(_ sender: Any) {
        // If the game is running and the first picture is clicked it increments the button click by 1
            if gameRunning == true {
                if counterThree < 1 {
                    hits += 1
                    counterThree += 1
                }
            }
            
            // If the game is over then this button is shut off
            if gameRunning == false {
                holeThree.isUserInteractionEnabled = false
            }
            
            // Determines if the mouse is hiding inside this hole, if it is.. it will change the image to the mouse, make the game text info not visible,
            // signal that the game is over, and calculate / display how many points were earned for winning depending on how many turns were used
            else if randomNumber == 3 {
                holeThree.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
                lblHoleThree.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
            
                if hits == 1 {
                    totalScore = totalScore + 30
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations!  You won 30 points!"
                    pointsEarned = 30
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
                else if hits == 2 {
                    totalScore = totalScore + 20
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations!  You won 20 points!"
                    pointsEarned = 20
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
                else if hits == 3 {
                    totalScore = totalScore + 10
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations!  You won 10 points!"
                    pointsEarned = 10
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
            }
                // if game is running it will determine if there is one of the stinky cheese inside this hole, it will change the image, make the game text info not visible
                // signal that the game is over, and calculate / display how many points are lost depending on how many turns were used (score can not go negative)
            else if gameRunning == true {
                if randomNumberStinkyOne == 3 || randomNumberStinkyTwo == 3 {
                    holeThree.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                    lblHoleThree.isHidden = true
                    lblRules.isHidden = true
                    lblOutcome.alpha = 1.0
                    gameRunning = false
            
                    holeOne.isUserInteractionEnabled = false
                    holeTwo.isUserInteractionEnabled = false
                    holeThree.isUserInteractionEnabled = false
                    holeFour.isUserInteractionEnabled = false
                    holeFive.isUserInteractionEnabled = false
                    holeSix.isUserInteractionEnabled = false
                        
                    if hits == 1 {
                        if totalScore >= 15 {
                            totalScore = totalScore - 15
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 15 points!"
                            pointsEarned = 15
                        }
                    }
                    else if hits == 2 {
                        if totalScore >= 10 {
                            totalScore = totalScore - 10
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 10 points!"
                            pointsEarned = 10
                        }
                    }
                    else if hits == 3 {
                        if totalScore >= 5 {
                            totalScore = totalScore - 5
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 5 points!"
                            pointsEarned = 5
                        }
                    }
                }
                else if randomNumberStinkyThree == 3 {
                    holeThree.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                    lblHoleThree.isHidden = true
                    lblRules.isHidden = true
                    lblOutcome.alpha = 1.0
                    gameRunning = false
                
                    holeOne.isUserInteractionEnabled = false
                    holeTwo.isUserInteractionEnabled = false
                    holeThree.isUserInteractionEnabled = false
                    holeFour.isUserInteractionEnabled = false
                    holeFive.isUserInteractionEnabled = false
                    holeSix.isUserInteractionEnabled = false
                            
                    if hits == 1 {
                        if totalScore >= 15 {
                            totalScore = totalScore - 15
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 15 points!"
                            pointsEarned = 15
                        }
                    }
                    else if hits == 2 {
                        if totalScore >= 10 {
                            totalScore = totalScore - 10
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 10 points!"
                            pointsEarned = 10
                        }
                    }
                    else if hits == 3 {
                        if totalScore >= 5 {
                            totalScore = totalScore - 5
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 5 points!"
                            pointsEarned = 5
                        }
                    }
                }
                    
                // This assumes the hole doesn't have a mouse or stinky cheese so it has a delicious cheese
                // it sets the picture to delicious cheese, makes the label not visible, increments the hint counter so
                // the user can use a hint and makes the hint button light up green
                else {
                    holeThree.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
                    lblHoleThree.isHidden = true
                    lblHoleThree.isUserInteractionEnabled = false
                    hintCounterOne += 1
                    btnHint.backgroundColor = UIColor.universalDeepBlue
                }
            }

        }
    
    @IBAction func holeFourPressed(_ sender: Any) {
    // If the game is running and the first picture is clicked it increments the button click by 1
            if gameRunning == true {
                if counterFour < 1 {
                    hits += 1
                    counterFour += 1
                }
            }
            
            // If the game is over then this button is shut off
            if gameRunning == false {
                holeFour.isUserInteractionEnabled = false
            }
            
            // Determines if the mouse is hiding inside this hole, if it is.. it will change the image to the mouse, make the game text info not visible,
            // signal that the game is over, and calculate / display how many points were earned for winning depending on how many turns were used
            else if randomNumber == 4 {
                holeFour.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
                lblHoleFour.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
            
                if hits == 1 {
                    totalScore = totalScore + 30
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations! You won 30 points!"
                    pointsEarned = 30
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
                else if hits == 2 {
                    totalScore = totalScore + 20
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations! You won 20 points!"
                    pointsEarned = 20
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
                else if hits == 3 {
                    totalScore = totalScore + 10
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations! You won 10 points!"
                    pointsEarned = 10
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
            }
                // if game is running it will determine if there is one of the stinky cheese inside this hole, it will change the image, make the game text info not visible
                // signal that the game is over, and calculate / display how many points are lost depending on how many turns were used (score can not go negative)
            else if gameRunning == true {
                if randomNumberStinkyOne == 4 || randomNumberStinkyTwo == 4 {
                    holeFour.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                    lblHoleFour.isHidden = true
                    lblRules.isHidden = true
                    lblOutcome.alpha = 1.0
                    gameRunning = false
            
                    holeOne.isUserInteractionEnabled = false
                    holeTwo.isUserInteractionEnabled = false
                    holeThree.isUserInteractionEnabled = false
                    holeFour.isUserInteractionEnabled = false
                    holeFive.isUserInteractionEnabled = false
                    holeSix.isUserInteractionEnabled = false
                        
                    if hits == 1 {
                        if totalScore >= 15 {
                            totalScore = totalScore - 15
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 15 points!"
                            pointsEarned = 15
                        }
                    }
                    else if hits == 2 {
                        if totalScore >= 10 {
                            totalScore = totalScore - 10
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 10 points!"
                            pointsEarned = 10
                        }
                    }
                    else if hits == 3 {
                        if totalScore >= 5 {
                            totalScore = totalScore - 5
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 5 points!"
                            pointsEarned = 5
                        }
                    }
                }
                else if randomNumberStinkyThree == 4 {
                    holeFour.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                    lblHoleFour.isHidden = true
                    lblRules.isHidden = true
                    lblOutcome.alpha = 1.0
                    gameRunning = false
                    
                    holeOne.isUserInteractionEnabled = false
                    holeTwo.isUserInteractionEnabled = false
                    holeThree.isUserInteractionEnabled = false
                    holeFour.isUserInteractionEnabled = false
                    holeFive.isUserInteractionEnabled = false
                    holeSix.isUserInteractionEnabled = false
                                
                    if hits == 1 {
                        if totalScore >= 15 {
                            totalScore = totalScore - 15
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 15 points!"
                            pointsEarned = 15
                        }
                    }
                    else if hits == 2 {
                        if totalScore >= 10 {
                            totalScore = totalScore - 10
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 10 points!"
                            pointsEarned = 10
                        }
                    }
                    else if hits == 3 {
                        if totalScore >= 5 {
                            totalScore = totalScore - 5
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 5 points!"
                            pointsEarned = 5
                        }
                    }
                }
                    
                // This assumes the hole doesn't have a mouse or stinky cheese so it has a delicious cheese
                // it sets the picture to delicious cheese, makes the label not visible, increments the hint counter so
                // the user can use a hint and makes the hint button light up green
                else {
                    holeFour.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
                    lblHoleFour.isHidden = true
                    lblHoleFour.isUserInteractionEnabled = false
                    hintCounterOne += 1
                    btnHint.backgroundColor = UIColor.universalDeepBlue
                }
            }

        }
    
    @IBAction func holeFivePressed(_ sender: Any) {
    // If the game is running and the first picture is clicked it increments the button click by 1
            if gameRunning == true {
                if counterFive < 1 {
                    hits += 1
                    counterFive += 1
                }
            }
            
            // If the game is over then this button is shut off
            if gameRunning == false {
                holeFive.isUserInteractionEnabled = false
            }
            
            // Determines if the mouse is hiding inside this hole, if it is.. it will change the image to the mouse, make the game text info not visible,
            // signal that the game is over, and calculate / display how many points were earned for winning depending on how many turns were used
            else if randomNumber == 5 {
                holeFive.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
                lblHoleFive.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
            
                if hits == 1 {
                    totalScore = totalScore + 30
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations! You won 30 points!"
                    pointsEarned = 30
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
                else if hits == 2 {
                    totalScore = totalScore + 20
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations! You won 20 points!"
                    pointsEarned = 20
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
                else if hits == 3 {
                    totalScore = totalScore + 10
                    lblTotalScore.text = String(totalScore)
                    lblOutcome.text = "Congratulations! You won 10 points!"
                    pointsEarned = 10
                    
                    if totalScore > highScore {
                        highScore = totalScore
                        lblHighScore.text = String(highScore)
                    }
                }
            }
                // if game is running it will determine if there is one of the stinky cheese inside this hole, it will change the image, make the game text info not visible
                // signal that the game is over, and calculate / display how many points are lost depending on how many turns were used (score can not go negative)
            else if gameRunning == true {
                if randomNumberStinkyOne == 5 || randomNumberStinkyTwo == 5 {
                    holeFive.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                    lblHoleFive.isHidden = true
                    lblRules.isHidden = true
                    lblOutcome.alpha = 1.0
                    gameRunning = false
            
                    holeOne.isUserInteractionEnabled = false
                    holeTwo.isUserInteractionEnabled = false
                    holeThree.isUserInteractionEnabled = false
                    holeFour.isUserInteractionEnabled = false
                    holeFive.isUserInteractionEnabled = false
                    holeSix.isUserInteractionEnabled = false
                        
                    if hits == 1 {
                        if totalScore >= 15 {
                            totalScore = totalScore - 15
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 15 points!"
                            pointsEarned = 15
                        }
                    }
                    else if hits == 2 {
                        if totalScore >= 10 {
                            totalScore = totalScore - 10
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 10 points!"
                            pointsEarned = 10
                        }
                    }
                    else if hits == 3 {
                        if totalScore >= 5 {
                            totalScore = totalScore - 5
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 5 points!"
                            pointsEarned = 5
                        }
                    }
                }
                else if randomNumberStinkyThree == 5 {
                    holeFive.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                    lblHoleFive.isHidden = true
                    lblRules.isHidden = true
                    lblOutcome.alpha = 1.0
                    gameRunning = false
                    
                    holeOne.isUserInteractionEnabled = false
                    holeTwo.isUserInteractionEnabled = false
                    holeThree.isUserInteractionEnabled = false
                    holeFour.isUserInteractionEnabled = false
                    holeFive.isUserInteractionEnabled = false
                    holeSix.isUserInteractionEnabled = false
                                
                    if hits == 1 {
                        if totalScore >= 15 {
                            totalScore = totalScore - 15
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 15 points!"
                            pointsEarned = 15
                        }
                    }
                    else if hits == 2 {
                        if totalScore >= 10 {
                            totalScore = totalScore - 10
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 10 points!"
                            pointsEarned = 10
                        }
                    }
                    else if hits == 3 {
                        if totalScore >= 5 {
                            totalScore = totalScore - 5
                            lblTotalScore.text = String(totalScore)
                            lblOutcome.text = "Unfortunately, you lost 5 points!"
                            pointsEarned = 5
                        }
                    }
                }
                    
                // This assumes the hole doesn't have a mouse or stinky cheese so it has a delicious cheese
                // it sets the picture to delicious cheese, makes the label not visible, increments the hint counter so
                // the user can use a hint and makes the hint button light up green
                else {
                    holeFive.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
                    lblHoleFive.isHidden = true
                    holeFive.isUserInteractionEnabled = false
                    hintCounterOne += 1
                    btnHint.backgroundColor = UIColor.universalDeepBlue
                }
            }
        }
    
    @IBAction func holeSixPressed(_ sender: Any) {
        // If the game is running and the first picture is clicked it increments the button click by 1
        if gameRunning == true {
            if counterSix < 1 {
                hits += 1
                counterFour += 1
            }
        }
                
        // If the game is over then this button is shut off
        if gameRunning == false {
            holeSix.isUserInteractionEnabled = false
        }
                
        // Determines if the mouse is hiding inside this hole, if it is.. it will change the image to the mouse, make the game text info not visible,
        // signal that the game is over, and calculate / display how many points were earned for winning depending on how many turns were used
        else if randomNumber == 6 {
            holeSix.setImage(UIImage(named:"mousemain.png"), for: UIControl.State.normal)
            lblHoleSix.isHidden = true
            lblRules.isHidden = true
            lblOutcome.alpha = 1.0
            gameRunning = false
                
            if hits == 1 {
                totalScore = totalScore + 30
                lblTotalScore.text = String(totalScore)
                lblOutcome.text = "Congratulations! You won 30 points!"
                pointsEarned = 30
                        
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
            else if hits == 2 {
                totalScore = totalScore + 20
                lblTotalScore.text = String(totalScore)
                lblOutcome.text = "Congratulations! You won 20 points!"
                pointsEarned = 20
                        
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
            else if hits == 3 {
                totalScore = totalScore + 10
                lblTotalScore.text = String(totalScore)
                lblOutcome.text = "Congratulations! You won 10 points!"
                pointsEarned = 10
                        
                if totalScore > highScore {
                    highScore = totalScore
                    lblHighScore.text = String(highScore)
                }
            }
        }
            
        // if game is running it will determine if there is one of the stinky cheese inside this hole, it will change the image, make the game text info not visible
        // signal that the game is over, and calculate / display how many points are lost depending on how many turns were used (score can not go negative)
        else if gameRunning == true {
            if randomNumberStinkyOne == 6 || randomNumberStinkyTwo == 6 {
                holeSix.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                lblHoleSix.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
                
                holeOne.isUserInteractionEnabled = false
                holeTwo.isUserInteractionEnabled = false
                holeThree.isUserInteractionEnabled = false
                holeFour.isUserInteractionEnabled = false
                holeFive.isUserInteractionEnabled = false
                holeSix.isUserInteractionEnabled = false
                        
                if hits == 1 {
                    if totalScore >= 15 {
                        totalScore = totalScore - 15
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 15 points!"
                        pointsEarned = 15
                    }
                }
                else if hits == 2 {
                    if totalScore >= 10 {
                        totalScore = totalScore - 10
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 10 points!"
                        pointsEarned = 10
                    }
                }
                else if hits == 3 {
                    if totalScore >= 5 {
                        totalScore = totalScore - 5
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 5 points!"
                        pointsEarned = 5
                    }
                }
            }
            else if randomNumberStinkyThree == 6 {
                holeSix.setImage(UIImage(named:"Stinky_Cheese.png"), for: UIControl.State.normal)
                lblHoleSix.isHidden = true
                lblRules.isHidden = true
                lblOutcome.alpha = 1.0
                gameRunning = false
            
                holeOne.isUserInteractionEnabled = false
                holeTwo.isUserInteractionEnabled = false
                holeThree.isUserInteractionEnabled = false
                holeFour.isUserInteractionEnabled = false
                holeFive.isUserInteractionEnabled = false
                holeSix.isUserInteractionEnabled = false
                    
                if hits == 1 {
                    if totalScore >= 15 {
                        totalScore = totalScore - 15
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 15 points!"
                        pointsEarned = 15
                    }
                }
                else if hits == 2 {
                    if totalScore >= 10 {
                        totalScore = totalScore - 10
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 10 points!"
                        pointsEarned = 10
                    }
                }
                else if hits == 3 {
                    if totalScore >= 5 {
                        totalScore = totalScore - 5
                        lblTotalScore.text = String(totalScore)
                        lblOutcome.text = "Unfortunately, you lost 5 points!"
                        pointsEarned = 5
                    }
                }
            }
                
            // This assumes the hole doesn't have a mouse or stinky cheese so it has a delicious cheese
            // it sets the picture to delicious cheese, makes the label not visible, increments the hint counter so
            // the user can use a hint and makes the hint button light up green
            else {
                holeSix.setImage(UIImage(named:"Good_Cheese.png"), for: UIControl.State.normal)
                lblHoleSix.isHidden = true
                lblHoleSix.isUserInteractionEnabled = false
                hintCounterOne += 1
                btnHint.backgroundColor = UIColor.universalDeepBlue
            }
        }
    }
}

