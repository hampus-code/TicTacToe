//
//  EnterPlayerNameViewController.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-12.
//

import UIKit

class RegisterComputerViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var playerOneTxtField: UITextField!
    @IBOutlet weak var computerTxtField: UITextField!
    
    
    var player: TicTacToe?
    
    var segueToComputerGame = "segueToComputerGame"

    override func viewDidLoad() {
        super.viewDidLoad()

        
        computerTxtField.text = "Computer"
        computerTxtField.isUserInteractionEnabled = false
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
        
        if segue.identifier == segueToComputerGame {
                
            guard let destinationVC = segue.destination as? ComputerGameViewController,
                  let playerOneName = playerOneTxtField.text,
                  let computerName = computerTxtField.text
                     else {
                return
            }
            
            let playerOne = Player(username: playerOneName)
            let computerPlayer = Player(username: computerName)
            
            print(playerOne, computerName)
            
            destinationVC.playerOneName = playerOneName
            destinationVC.computerName = computerName
            
                    
        }
    }
    

}
