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
    
     
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }


}

