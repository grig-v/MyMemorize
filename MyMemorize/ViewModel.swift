//
//  ViewModel.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐒", "🐔", "🐣", "🦅", "🦇", "🐺"]
    
    private static func startGame() -> Model<String> {
        return Model(numberOfPairs: 15, cardFactory: { pairIndex in
            if ViewModel.emojis.indices.contains(pairIndex) {
                return ViewModel.emojis[pairIndex]
            } else {
                return "🚫"
            }
        })
    }
    
    @Published private var model: Model<String> = startGame()
    
    var cards: [Model<String>.Card] {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func chose(_ card: Model<String>.Card) {
        model.chose(card)
    }
}


