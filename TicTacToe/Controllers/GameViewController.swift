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
    
    
    //To check which player's turn it is
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    
    //The inital position for the X and the O
    var initialXPosition: CGPoint = CGPoint.zero
    var initialOPosition: CGPoint = CGPoint.zero
    
    //To check which square is which in the gameBoard
    var gameBoard = [0,1,2,3,4,5,6,7,8]
    

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
    
    //Drag function for X
    @IBAction func onDragX(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: self.view)
        
        playerOneCross.center = CGPoint(x: translation.x + playerOneCross.center.x, y: translation.y + playerOneCross.center.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
        if sender.state == .ended {
            
            //To check frames in the UIImageView outlet collections
            for squares in boardSquares {
                let frame = squares.frame
                print("Frame of imageView: \(frame)")
                print("Frame of playerOneCross: \(playerOneCross.frame)")
                
                
                let squareFrameInSuperview = squares.convert(squares.bounds, to: self.view)
                let crossFrameInSuperview = playerOneCross.convert(playerOneCross.bounds, to: self.view)
                            
                print("Frame of imageView: \(squareFrameInSuperview)")
                print("Frame of playerOneCross: \(crossFrameInSuperview)")
                            
                // Check if playerOneCross frame is within the frame of squares
                if squareFrameInSuperview.contains(crossFrameInSuperview) {
                    
                    let replaceWithX = squares.image
                    squares.image = playerOneCross.image
                    
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
            for squares in boardSquares {
                let frame = squares.frame
                print("Frame of imageView: \(frame)")
                print("Frame of playerOneCross: \(playerTwoCircle.frame)")
                
                
                let squareFrameInSuperview = squares.convert(squares.bounds, to: self.view)
                let circleFrameInSuperview = playerTwoCircle.convert(playerTwoCircle.bounds, to: self.view)
                            
                print("Frame of imageView: \(squareFrameInSuperview)")
                print("Frame of playerOneCross: \(circleFrameInSuperview)")
                            
                // Check if playerTwoCircle frame is within the frame of squares
                if squareFrameInSuperview.contains(circleFrameInSuperview) {
                    
                    let replaceWithX = squares.image
                    squares.image = playerTwoCircle.image
                    
                }
                
            }
            
            playerTwoCircle.center = initialXPosition
        }
        
        
    }
    
        
}
    

