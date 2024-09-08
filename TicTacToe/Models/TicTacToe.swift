//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-03.
//

import Foundation

class TicTacToe {
    
    //To check which player's turn it is
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    var currentPlayerPlaying = true
    
    func startGame(at index: Int) {
        //Try to use tag and try to map through all the tags??
        if gameBoard[index] == 0 {
            if currentPlayerPlaying {
                gameBoard[index] = PLAYER_ONE
            } else {
                gameBoard[index] = PLAYER_TWO
            }
            
            currentPlayerPlaying.toggle()
            
            
        }
        checkWinnerHorizontally(at: index)
        checkWinnerVertically(at: index)
        checkWinnerDiagonally(at: index)
        
    }
    
    func checkWinnerHorizontally(at index: Int) {
        
        switch index {
        case 0,1,2:
            if gameBoard[0] == PLAYER_ONE && gameBoard[1] == PLAYER_ONE && gameBoard[2] == PLAYER_ONE {
                print("Player 1 wins horizontally at row 1")
            } else if gameBoard[0] == PLAYER_TWO && gameBoard[1] == PLAYER_TWO && gameBoard[2] == PLAYER_TWO {
                print("Player 2 wins at horizontally row 1")
            }
        case 3,4,5:
            if gameBoard[3] == PLAYER_ONE && gameBoard[4] == PLAYER_ONE && gameBoard[5] == PLAYER_ONE {
                print("Player 1 wins at horizontally row 2")
            } else if gameBoard[3] == PLAYER_TWO && gameBoard[4] == PLAYER_TWO && gameBoard[5] == PLAYER_TWO {
                print("Player 2 wins at horizontally row 2")
            }
        case 6,7,8:
            if gameBoard[6] == PLAYER_ONE && gameBoard[7] == PLAYER_ONE && gameBoard[8] == PLAYER_ONE {
                print("Player 1 wins at horizontally row 3")
            } else if gameBoard[6] == PLAYER_TWO && gameBoard[7] == PLAYER_TWO && gameBoard[8] == PLAYER_TWO {
                print("Player 2 wins at horizontally row 3")
            }
        default:
            if !gameBoard.contains(0) {
                print("No winner here, it's a tie!")
            }
        }
        
        
    }
    
    func checkWinnerVertically(at index: Int) {
        
        switch index {
        case 0,3,6:
            if gameBoard[0] == PLAYER_ONE && gameBoard[3] == PLAYER_ONE && gameBoard[6] == PLAYER_ONE {
                print("Player 1 wins vertically at row 1")
            } else if gameBoard[0] == PLAYER_TWO && gameBoard[3] == PLAYER_TWO && gameBoard[6] == PLAYER_TWO {
                print("Player 2 wins at horizontally row 1")
            }
        case 1,4,7:
            if gameBoard[1] == PLAYER_ONE && gameBoard[4] == PLAYER_ONE && gameBoard[7] == PLAYER_ONE {
                print("Player 1 wins at vertically row 2")
            } else if gameBoard[1] == PLAYER_TWO && gameBoard[4] == PLAYER_TWO && gameBoard[7] == PLAYER_TWO {
                print("Player 2 wins at vertically row 2")
            }
        case 2,5,8:
            if gameBoard[2] == PLAYER_ONE && gameBoard[5] == PLAYER_ONE && gameBoard[8] == PLAYER_ONE {
                print("Player 1 wins at vertically row 3")
            } else if gameBoard[2] == PLAYER_TWO && gameBoard[5] == PLAYER_TWO && gameBoard[8] == PLAYER_TWO {
                print("Player 2 wins at vertically row 3")
            }
        default:
            if !gameBoard.contains(0) {
                print("No winner here, it's a tie!")
            }
        }
        
    }
    
    func checkWinnerDiagonally(at index: Int) {
        
        switch index {
        case 0,4,8:
            if gameBoard[0] == PLAYER_ONE && gameBoard[4] == PLAYER_ONE && gameBoard[8] == PLAYER_ONE {
                print("Player 1 wins diagonally at the left")
            } else if gameBoard[0] == PLAYER_TWO && gameBoard[4] == PLAYER_TWO && gameBoard[8] == PLAYER_TWO {
                print("Player 2 wins at diagonally at the left")
            }
        case 2,4,6:
            if gameBoard[2] == PLAYER_ONE && gameBoard[4] == PLAYER_ONE && gameBoard[6] == PLAYER_ONE {
                print("Player 1 wins at diagonally at the right")
            } else if gameBoard[2] == PLAYER_TWO && gameBoard[4] == PLAYER_TWO && gameBoard[6] == PLAYER_TWO {
                print("Player 2 wins at diagonally at the right")
            }
        default:
            if !gameBoard.contains(0) {
                print("No winner here, it's a tie!")
            }
        }
        
        
    }
    
    
}
