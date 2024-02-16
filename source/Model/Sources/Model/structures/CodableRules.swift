//
//  File.swift
//
//  Created by etudiant on 2/16/24.
//

import Foundation

public struct CodableRules : Codable {
    public var occurences : [Board:Int]
    public var historic : [Move]
    public var rulesType : String
    
    public init(rule : Rules) {
        self.occurences = rule.occurences
        self.historic = rule.historic
        self.rulesType = String(describing: type(of: rule))
    }
    
    public func initRules() -> Rules? {
        switch self.rulesType {
        case "VerySimleRules":
            return VerySimpleRules(occurences: occurences, historic : historic)
        case "ClassicRules":
            //return Classic(occurences: occurences, historic : historic)
            return nil
        default:
            return nil
        }
    }
}
