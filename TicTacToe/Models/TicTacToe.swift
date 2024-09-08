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
    
    func checkWinnerVertically() {
        
        
        
        
    }
    
    func checkWinnerHorizontally() {
        
        
        
    }
    
    func checkWinnerDiagonally() {
        
        
        
    }
    
    func checkTie() {
        
        
        
    }
    
    
    
}
