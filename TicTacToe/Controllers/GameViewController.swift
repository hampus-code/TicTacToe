//
//  ViewController.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-03.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet var boardSquares: [UIImageView]!
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    @IBOutlet weak var scorePlayerOne: UILabel!
    @IBOutlet weak var scorePlayerTwo: UILabel!
    
    @IBOutlet weak var playerOneCross: UIImageView!
    @IBOutlet weak var playerTwoCircle: UIImageView!
    
    
    //Initializing the business logic
    var game = TicTacToe()
    
    let segueToMainMenu = "segueToMainMenu"
    
    var playerOneName: String?
    var playerTwoName: String?
    
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
        
        playerOneLabel.text = playerOneName ?? "Player 1"
        playerTwoLabel.text = playerTwoName ?? "Player 2"
        
        
        //When the game is over an alert message is shown
        game.onGameEnd = { [weak self] winner in
            if winner == "It's a tie" {
                self?.gameOverAlertMessage(title: "Game Over", message: "It's a tie")
            } else {
                self?.gameOverAlertMessage(title: "Game Over", message: "\(winner) wins!")
            }
            
            //To update the score (i have put in the code her temporarly
            if winner == "Player 1" {
                self?.scorePlayerOneValue += 1
                self?.scorePlayerOne.text = "Score: \(self?.scorePlayerOneValue ?? 0)"
            } else if winner == "Player 2" {
                self?.scorePlayerTwoValue += 1
                self?.scorePlayerTwo.text = "Score: \(self?.scorePlayerTwoValue ?? 0)"
            }
            
                }
            showPlayerTurn()
        
    }
    
    func showPlayerTurn() {
        
        
        if game.currentPlayerPlaying {
            playerTwoCircle.tintColor = .clear
            playerOneCross.tintColor = .systemBlue
        } else if !game.currentPlayerPlaying {
            playerOneCross.tintColor = .clear
            playerTwoCircle.tintColor = .systemRed
            
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
        
        game.currentPlayerPlaying = true
        showPlayerTurn()
        
    }
    
    
    //for alert
    func gameModeState() {
        
        
    }
    
    
    //Alert message when someone have won the game or if it is a tie
    func gameOverAlertMessage(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Main Menu", style: UIAlertAction.Style.default, handler: { action in
            self.performSegue(withIdentifier: self.segueToMainMenu, sender: self)
        }))
        
        //Resets the gameBoard when "Play Again" is clicked
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { action in
            self.resetGameBoard()}))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    //Drag function for X
    @IBAction func onDragX(_ sender: UIPanGestureRecognizer) {
        onDragSymbols(sender, symbol: playerOneCross, systemName: "xmark", originalPosition: initialXPosition, opponentSymbolImage: playerTwoCircle.image, currentPlayer: true)
        
    }
    
    //Drag function for O
    @IBAction func onDragO(_ sender: UIPanGestureRecognizer) {
        onDragSymbols(sender, symbol: playerTwoCircle, systemName: "circle", originalPosition: initialOPosition, opponentSymbolImage: playerOneCross.image, currentPlayer: false)
        
    }
    
    //Genral onDragFunction for both symbols
    func onDragSymbols(_ sender: UIPanGestureRecognizer, symbol: UIImageView, systemName: String, originalPosition: CGPoint, opponentSymbolImage: UIImage?, currentPlayer: Bool) {
        
        let translation = sender.translation(in: self.view)
        
        symbol.center = CGPoint(x: translation.x + symbol.center.x, y: translation.y + symbol.center.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        if sender.state == .ended {
            
            //To check frames in the UIImageView outlet collections
            for (index, squares) in boardSquares.enumerated() {

        
                    let squaresFrameInSuperview = squares.convert(squares.bounds, to: self.view)
                    let symbolFrameInSuperview = symbol.convert(symbol.bounds, to: self.view)

                    
                    // Check if the symbols frame is within the frame of the squares
                if squaresFrameInSuperview.contains(symbolFrameInSuperview) && squares.image != opponentSymbolImage &&  game.currentPlayerPlaying == currentPlayer {
                        squares.image = UIImage(systemName: systemName)
                        squares.tintColor = (systemName == "xmark") ? UIColor.systemBlue : UIColor.systemRed
                        
                        game.startGame(at: index)
                        showPlayerTurn()
                        print(game.gameBoard)
                        
                        
                        
                    }
                }
            
            symbol.center = initialXPosition
        }
        
    }
    
        
}
    

