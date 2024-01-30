//
//  main.swift
//  DouShouQi_CLI
//
//  Created by etudiant on 12/01/2024.
//

import Foundation
import Model
import ModelEmojiDisplayer

// Grid for board declaration
let grid: [[Cell]] = [
    [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .lion)),
     Cell(cellType: .jungle),
     Cell(cellType: .trap),
     Cell(cellType: .den),
     Cell(cellType: .trap),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .tiger))],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .dog)),
     Cell(cellType: .jungle),
     Cell(cellType: .trap),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .cat)),
     Cell(cellType: .jungle)],
    
    [Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .rat)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .leopard)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .wolf)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player1, piece: Piece(owner: .player1, animal: .elephant))],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),
     Cell(cellType: .water),
     Cell(cellType: .water),
     Cell(cellType: .jungle),],
    
    [Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .elephant)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .wolf)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .leopard)),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .rat))],
    
    [Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .cat)),
     Cell(cellType: .jungle),
     Cell(cellType: .trap),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .dog)),
     Cell(cellType: .jungle)],
    
    [Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .tiger)),
     Cell(cellType: .jungle),
     Cell(cellType: .trap),
     Cell(cellType: .den),
     Cell(cellType: .trap),
     Cell(cellType: .jungle),
     Cell(cellType: .jungle, initialOwner: .player2, piece: Piece(owner: .player2, animal: .lion))],
    
]

// Test board display -------------
var board = Board(grid: grid)
// print(board ?? "error initializing board")

// Count pieces of player 1 -------------
print ("count piece of player1 (should be 8) : \(board?.countPieces(of: .player1) ?? 0)")

// Count pieces for both players -------------
let allPieceCounts = board?.countPieces()
print("count piece of player1 (should be 8) : \(allPieceCounts?.player1 ?? 0)")
print("count piece of player2 (should be 8) : \(allPieceCounts?.player2 ?? 0)")

// Insertion tests -------------
// Success
let insertSuccessRes = board?.insert(piece: Piece(owner: .player2, animal: .rat), atRow: 6,andColumn: 6)
print("this insert test should be .ok \(insertSuccessRes ?? .unknown)")
print("New board")
print(board ?? "duh")
// Fail out of range
let insertFailOutOfBound = board?.insert(piece: Piece(owner: .player2, animal: .rat), atRow: 6,andColumn: 7)
print("this insert test should be .outOfBound \(insertFailOutOfBound ?? .unknown)")
// Fail cell not empty
let insertFailNotEmptyCell = board?.insert(piece: Piece(owner: .player2, animal: .rat), atRow: 7,andColumn: 6)
print("this insert test should be .cellNotEmpty \(insertFailNotEmptyCell ?? .unknown)")


// Remove tests -------------
// Success
let removeSuccessRes = board?.removePiece(atRow: 7,andColumn: 6)
print("this insert test should be .ok \(removeSuccessRes ?? .unknown)")
print("New board")
print(board ?? "duh")
// Fail out of range
let removeFailOutOfBound = board?.removePiece(atRow: 6,andColumn: 7)
print("this insert test should be .outOfBound \(removeFailOutOfBound ?? .unknown)")
// Fail cell not empty
let removeFailEmptyCell = board?.removePiece(atRow: 7,andColumn: 6)
print("this insert test should be .cellEmpty \(removeFailEmptyCell ?? .unknown)")
