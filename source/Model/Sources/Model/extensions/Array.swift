//
//  Array.swift
//  
//
//  Created by etudiant on 1/17/24.
//

import Foundation

public extension Array where Element : Collection {
    // This function is mapping on all the elements in the array of arrays and apply the given function to it
    func map(andApplyFunction function: (Element.Element)->Void){
        for row in self {
            for column in row {
                function(column)
            }
        }
    }
}
