//
//  ViewController.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-03.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet var boardSquares: [UIImageView]!
    
    @IBOutlet weak var scorePlayerOne: UILabel!
    @IBOutlet weak var scorePlayerTwo: UILabel!
    
    @IBOutlet weak var playerOneCross: UIImageView!
    @IBOutlet weak var playerTwoCircle: UIImageView!
    
    
    //Initial the TicTacToe class
    var game = TicTacToe()
    
    
    //The inital position for the X and the O
    var initialXPosition: CGPoint = CGPoint.zero
    var initialOPosition: CGPoint = CGPoint.zero
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialXPosition = playerOneCross.center
        initialOPosition = playerTwoCircle.center
        
        
        
        /*
        for (index, square) in boardSquares.enumerated() {
            
            print("Square: \(square.tag) at Index: \(index)")
            
        }
         */

    }
    
    
    
    func gameFinishedAlertMessage(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
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
    

