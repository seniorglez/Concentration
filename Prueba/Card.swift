//
//  Card.swift
//  Prueba
//
//  Created by Diego Dominguez on 18/01/2020.
//  Copyright © 2020 Diego Dominguez. All rights reserved.
//
import Foundation

//struct es muy similar a las clases. Struct son valores primitivos, es decir se copian. De forma real solo son copiados cuando se cambia el valor es por eso que swift es muy eficiente
struct Card: Hashable
{
    var hashValue: Int{return identifier}

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func ==(lhs: Card, rhs: Card)->Bool{
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
