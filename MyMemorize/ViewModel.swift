//
//  ViewModel.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import Foundation
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
    
    init() {
        self.theme = ViewModel.createNewTheme()
        self.model = ViewModel.startGame(theme: theme)
    }
    
    func newGame() {
        self.theme = ViewModel.createNewTheme()
        self.model = ViewModel.startGame(theme: theme)
    }
    
    private static func createNewTheme() -> Theme {
        let theme = themes.randomElement() ?? errorTheme
        return theme
    }
    
    var theme: Theme
    
    @Published private var model: Model<String>
    
    var cards: [Model<String>.Card] {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func chose(_ card: Model<String>.Card) {
        model.chose(card)
    }
    
    static let themes: [Theme] = [
        Theme(name: "Animals",
              emoji: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐒", "🐔", "🐣", "🦅", "🦇", "🐺"],
              color: "green"),
        Theme(name: "Halloween",
              emoji: ["👹", "💀", "🤡", "🤖", "🎃", "👻", "👽", "🥷", "🧟", "🧚‍♀️", "🧜‍♀️", "🧛🏻‍♀️", "🧌", "🦇", "🕷️"],
              color: "orange"),
        Theme(name: "Food",
              emoji: ["🍏", "🥝", "🍗", "🥓", "🥑", "🍳", "🍕", "🌮", "🍞", "🥐", "🍫"],
              color: "yellow"),
        Theme(name: "Numbers",
              emoji: ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟"],
              color: "gray"),
        Theme(name: "Countries",
              emoji: ["🇦🇹", "🇦🇬", "🇧🇪", "🇧🇷", "🇧🇴", "🇧🇧", "🇨🇳", "🇨🇦", "🇩🇰", "🇬🇪", "🇲🇰", "🇰🇷" ],
              color: "white")
    ]
    static let errorTheme = Theme(name: "Error", emoji: ["🚫"], color: "white")
}




