//
//  ViewModel.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    private static func startGame(theme: Theme) -> Model<String> {
        return Model(numberOfPairs: theme.numberOfPairs, cardFactory: { pairIndex in
            if theme.emoji.indices.contains(pairIndex) {
                return theme.emoji[pairIndex]
            } else {
                return "🚫"
            }
        })
    }
    
    var theme: Theme
    @Published private var model: Model<String> 
    
    var cards: [Model<String>.Card] {
        return model.cards
    }
    
    var score: Int {
        model.score
    }
    
    init(theme: Theme) {
        self.theme = theme
        self.model = ViewModel.startGame(theme: self.theme)
    }

    
//    MARK: - Intentions
    func newGame() {
        self.model = ViewModel.startGame(theme: theme)
    }
    
    func chose(_ card: Model<String>.Card) {
        model.chose(card)
    }
}




