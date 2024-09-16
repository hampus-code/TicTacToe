//
//  EnterPlayerNameViewController.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-12.
//

import UIKit

class EnterPlayerNameViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var playerOneTxtField: UITextField!
    @IBOutlet weak var playerTwoTxtField: UITextField!
    
    var player: TicTacToe?
    
    var segueToGame = "segueToGame"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueToGame {
                
            guard let destinationVC = segue.destination as? GameViewController,
                  let playerOneName = playerOneTxtField.text,
                    let playerTwoName = playerTwoTxtField.text else {
                return
            }
            
            let playerOne = Player(username: playerOneName)
            let playerTwo = Player(username: playerTwoName)
            print(playerOne, playerTwo)
            
            destinationVC.playerOneName = playerOneName
            destinationVC.playerTwoName = playerTwoName
                    
        }
    }
    

}
