//
//  ViewModel.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI
import Combine

@Observable class ViewModel {
    
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
    private var model: Model<String>
    
    var cards: [Model<String>.Card] {
        return model.cards
    }
    
    var score: Int {
        model.score
    }
    
    init(theme: Theme) {
        self.theme = theme
        self.model = ViewModel.startGame(theme: theme)
    }
    
    // Just for previews
    init() {
        typealias RGBA = Theme.RGBA
        let themeSample = Theme(name: "Food",
                                emoji: ["🍏", "🥝", "🍗", "🥓", "🥑", "🍳", "🍕", "🌮", "🍞", "🥐", "🍫"],
                                cardColor: RGBA(red: 1, green: 0.9, blue: 0, alpha: 1),
                                background: [RGBA(red: 1, green: 0.8, blue: 0, alpha: 1), RGBA(red: 0.2, green: 0.6, blue: 0, alpha: 1)])
        self.theme = themeSample
        self.model = ViewModel.startGame(theme: themeSample)
    }
    
//    MARK: - Intentions
    func newGame() {
        self.model = ViewModel.startGame(theme: theme)
    }
    
    func chose(_ card: Model<String>.Card) {
        model.chose(card)
    }
}




