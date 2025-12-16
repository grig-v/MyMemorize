//
//  Model.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import Foundation

struct Model<CardContent> {
    
    private(set) var cards: [Card]
    
    mutating func createDeck(numberOfPairs: Int, cardFactory: (Int) -> Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func chose() {
        
    }
    
    struct Card {
        let content: CardContent
        var isFaceUp = false
        var isMatch = false
    }
}


