//
//  Result.swift
//
//
//  Created by etudiant on 1/22/24.
//

import Foundation

public enum Result {
    case notFinished
    case even
    case winner(owner: Owner, reason: WinningReason)
}
