//
//  ViewController.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-03.
//

import UIKit

class GameViewController: UIViewController {
    
    //Make play against computer in main menu?
    
    @IBOutlet var boardSquares: [UIImageView]!
    
    @IBOutlet weak var scorePlayerOne: UILabel!
    @IBOutlet weak var scorePlayerTwo: UILabel!
    
    @IBOutlet weak var playerOneCross: UIImageView!
    @IBOutlet weak var playerTwoCircle: UIImageView!
    
    
    //Initial the business logic
    var game = TicTacToe()
    
    
    //The inital position for the X and the O
    var initialXPosition: CGPoint = CGPoint.zero
    var initialOPosition: CGPoint = CGPoint.zero
    
    var scorePlayerOneValue = 0
    var scorePlayerTwoValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialXPosition = playerOneCross.center
        initialOPosition = playerTwoCircle.center
        
        //When the game is over a alert message is shown
        game.onGameEnd = { [weak self] winner in
                    self?.gameOverAlertMessage(title: "Game Over", message: "\(winner) wins!")
            
            
            //To update the score (i have put in the code her temporarly
            if winner == "Player 1" {
                self?.scorePlayerOneValue += 1
                self?.scorePlayerOne.text = "Score: \(self?.scorePlayerOneValue ?? 0)"
            } else if winner == "Player 2" {
                self?.scorePlayerTwoValue += 1
                self?.scorePlayerTwo.text = "Score: \(self?.scorePlayerTwoValue ?? 0)"
            }
            
                }

        

    }
    
    func resetGameBoard() {
        
        for square in boardSquares {
            
            if square.image == UIImage(systemName: "xmark"){
                square.image = UIImage(systemName: "square")?.withTintColor(.black)
                square.tintColor = .black
                
            } else if square.image == UIImage(systemName: "circle"){
                square.image = UIImage(systemName: "square")
                square.tintColor = .black
            }
        }
        
    }
    
    //for alert
    func gameModeState() {
        
        
    }
    
    
    //Alert message when someone have won the game or if it is a tie
    func gameOverAlertMessage(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Main Menu", style: UIAlertAction.Style.default, handler: nil))
        
        //Resets the gameBoard when "Play Again" is clicked
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { action in
            self.resetGameBoard()}))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    //Drag function for X
    @IBAction func onDragX(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: self.view)
        
        playerOneCross.center = CGPoint(x: translation.x + playerOneCross.center.x, y: translation.y + playerOneCross.center.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
        if sender.state == .ended {
            
            
            //To check frames in the UIImageView outlet collections
            for (index, squares) in boardSquares.enumerated() {
                //let frame = squares.frame
                //print("Frame of imageView: \(frame)")
                //print("Frame of playerOneCross: \(playerOneCross.frame)")
                
                
                let squareFrameInSuperview = squares.convert(squares.bounds, to: self.view)
                let crossFrameInSuperview = playerOneCross.convert(playerOneCross.bounds, to: self.view)
                            
                //print("Frame of imageView: \(squareFrameInSuperview)")
                //print("Frame of playerOneCross: \(crossFrameInSuperview)")
                            
                // Check if playerOneCross frame is within the frame of squares
                if squareFrameInSuperview.contains(crossFrameInSuperview) && game.currentPlayerPlaying && squares.image != playerTwoCircle.image {
                    
                    
                    squares.image = playerOneCross.image
                    squares.tintColor = playerOneCross.tintColor
                    
                    
                    game.startGame(at: index)
                    print(game.gameBoard)
                    
                    
                    
                }
                
            }
            
            playerOneCross.center = initialXPosition
        }
        
        
    }
    
    //Drag function for O
    @IBAction func onDragO(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        playerTwoCircle.center = CGPoint(x: translation.x + playerTwoCircle.center.x, y: translation.y + playerTwoCircle.center.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        if sender.state == .ended {
            
            //To check frames in the UIImageView outlet collections
            for (index, squares) in boardSquares.enumerated() {
                //let frame = squares.frame
                //print("Frame of imageView: \(frame)")
                //print("Frame of playerOneCross: \(playerTwoCircle.frame)")
                
                
                let squareFrameInSuperview = squares.convert(squares.bounds, to: self.view)
                let circleFrameInSuperview = playerTwoCircle.convert(playerTwoCircle.bounds, to: self.view)
                            
                //print("Frame of imageView: \(squareFrameInSuperview)")
                //print("Frame of playerOneCross: \(circleFrameInSuperview)")
                            
                // Check if playerTwoCircle frame is within the frame of squares
                if squareFrameInSuperview.contains(circleFrameInSuperview) && !game.currentPlayerPlaying && squares.image != playerOneCross.image {
                    
                    squares.image = playerTwoCircle.image
                    squares.tintColor = playerTwoCircle.tintColor
                    
                    game.startGame(at: index)
                    print(game.gameBoard)
                    
                    
                    
                }
                
            }
            
            playerTwoCircle.center = initialXPosition
        }
        
        
    }
    
    
    
        
}
    

