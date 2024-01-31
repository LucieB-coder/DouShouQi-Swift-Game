//
//  InvalidBoardError.swift
//
//
//  Created by etudiant on 1/22/24.
//

import Foundation

public enum InvalidBoardError : Error {
    case badDimensions(nbRows: Int, nbColumns: Int)
    case badCellType(cellType: CellType, row: Int, column: Int)
    case multipleOccurencesOfSamePiece(piece: Piece)
    case pieceWithNoOwner(piece: Piece)
    case pieceNotAllowedOnThisCell(piece: Piece,cell: Cell)
}
