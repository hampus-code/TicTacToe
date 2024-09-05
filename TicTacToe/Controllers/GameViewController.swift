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
    
    var initalXPosition: CGPoint = CGPoint.zero
    var initalOPosition: CGPoint = CGPoint.zero
    
    //To check which board is which
    var gameBoard = [0,1,2,3,4,5,6,7,8]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initalXPosition = playerOneCross.center
        initalOPosition = playerTwoCircle.center
        
        /*
        for (index, square) in boardSquares.enumerated() {
            
            print("Square: \(square.tag) at Index: \(index)")
            
        }
         */

    }
    
    //Drag function
    @IBAction func onDragX(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: self.view)
        
        playerOneCross.center = CGPoint(x: translation.x + playerOneCross.center.x, y: translation.y + playerOneCross.center.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
        if sender.state == .ended {
            
            //To check frames in the UIImageView outlet collections
            for squares in boardSquares {
                let frame = squares.frame
                print("Frame of imageView: \(frame)")
                
                if squares.frame.contains(playerOneCross.frame) {
                    sender.state = .ended
                    
                }
                    }
            
            playerOneCross.center = initalXPosition
        }
        
        
    }
    
    
    @IBAction func onDragO(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        playerTwoCircle.center = CGPoint(x: translation.x + playerTwoCircle.center.x, y: translation.y + playerTwoCircle.center.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
        if sender.state == .ended {
            
            playerTwoCircle.center = initalOPosition
            
        }
        
        
    }
    
        
}
    

