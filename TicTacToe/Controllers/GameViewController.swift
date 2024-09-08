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
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    var currentPlayerPlaying = true
    

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
            for (index, squares) in boardSquares.enumerated() {
                //let frame = squares.frame
                //print("Frame of imageView: \(frame)")
                //print("Frame of playerOneCross: \(playerOneCross.frame)")
                
                
                let squareFrameInSuperview = squares.convert(squares.bounds, to: self.view)
                let crossFrameInSuperview = playerOneCross.convert(playerOneCross.bounds, to: self.view)
                            
                //print("Frame of imageView: \(squareFrameInSuperview)")
                //print("Frame of playerOneCross: \(crossFrameInSuperview)")
                            
                // Check if playerOneCross frame is within the frame of squares
                if squareFrameInSuperview.contains(crossFrameInSuperview) {
                    
                    
                    squares.image = playerOneCross.image
                    squares.tintColor = playerOneCross.tintColor
                    
                    checkGameBoard(at: index)
                    print(gameBoard)
                    
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
                if squareFrameInSuperview.contains(circleFrameInSuperview) {
                    
                    squares.image = playerTwoCircle.image
                    squares.tintColor = playerTwoCircle.tintColor
                    
                    checkGameBoard(at: index)
                    print(gameBoard)
                    
                    
                }
                
            }
            
            playerTwoCircle.center = initialXPosition
        }
        
        
    }
    
    func checkGameBoard(at index: Int) {
        //Try to use tag and try to map through all the tags??
        if gameBoard[index] == 0 {
            if currentPlayerPlaying {
                gameBoard[index] = PLAYER_ONE
            } else {
                gameBoard[index] = PLAYER_TWO
            }
            
            currentPlayerPlaying.toggle()
            
        }
        
    }
    
    
        
}
    

