//
//  CoadableBoard.swift
//
//
//  Created by etudiant on 2/12/24.
//

import Foundation
import Model

extension Board : Codable {
    private enum CodingKeys: String, CodingKey {
        case grid
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let grid : [[Cell]] = try container.decode([[Cell]].self, forKey: .grid)
        self.init(grid: grid)!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(grid, forKey: .grid)
    }
}
