//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-03.
//

import Foundation

class TicTacToe {
    
    var players: [Player] = []
    
    //Closure
    var onGameEnd: ((String) -> Void)?
    
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    var currentPlayerPlaying = true
    
    func addPlayers(player: Player) {
        
        players.append(player)
    }
    
    func startGame(at index: Int) {
        
        if gameBoard[index] == 0 {
            if currentPlayerPlaying {
                gameBoard[index] = PLAYER_ONE
            } else {
                gameBoard[index] = PLAYER_TWO
            }
            
            currentPlayerPlaying.toggle()
            
        }
        
        if let winner = checkForWinner(at: index) {
                        onGameEnd?(winner)
                        resetGameBoardArray()
                    }
        
    }
    
    
    
    //Checks all my functions that checks the rows and columns and show if there is a winner or tie
    func checkForWinner(at index: Int) -> String? {
            if checkWinnerHorizontally(at: index) || checkWinnerVertically(at: index) || checkWinnerDiagonally(at: index) {
                return currentPlayerPlaying ? "Player 2" : "Player 1"
            } else if !gameBoard.contains(0) {
                
                return "It's a tie"
            
            }
            return nil
        }
    
    
    
    //Checks winner Horizontally
    func checkWinnerHorizontally(at index: Int) -> Bool {
            switch index {
            case 0, 1, 2:
                //Checks if every index contains the same thing, for example index 0,1,2 contains 1 or 2
                return gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2] && gameBoard[0] != 0
            case 3, 4, 5:
                return gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5] && gameBoard[3] != 0
            case 6, 7, 8:
                return gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8] && gameBoard[6] != 0
            default:
                return false
            }
        }
    
    //Checks winner Vertically
    func checkWinnerVertically(at index: Int) -> Bool {
            switch index {
            case 0, 3, 6:
                //Checks if every index contains the same thing
                return gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6] && gameBoard[0] != 0
            case 1, 4, 7:
                return gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7] && gameBoard[1] != 0
            case 2, 5, 8:
                return gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8] && gameBoard[2] != 0
            default:
                return false
            }
        }
    
    //Checks winner Diagonally
    func checkWinnerDiagonally(at index: Int) -> Bool {
            switch index {
            case 0, 4, 8:
                //Checks if every index contains the same thing
                return gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8] && gameBoard[0] != 0
            case 2, 4, 6:
                return gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6] && gameBoard[2] != 0
            default:
                return false
            }
        }
    
    //Resets gameBoard array
    func resetGameBoardArray() {
        
        gameBoard = [0,0,0,0,0,0,0,0,0]
    }
    
    
}

