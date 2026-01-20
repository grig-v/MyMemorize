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
    
    private static func createNewTheme() -> Theme {
        let theme = themes.randomElement() ?? errorTheme
        return theme
    }
    
    var theme: Theme
    @Published private var model: Model<String>
    
    var cards: [Model<String>.Card] {
        return model.cards
    }
    
    var score: Int {
        model.score
    }
    
    init() {
        self.theme = ViewModel.createNewTheme()
        self.model = ViewModel.startGame(theme: theme)
    }
    
    var themeColor: Color {
        switch theme.cardColor {
        case "green":
            return Color.green
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "gray":
            return .gray
        case "blue":
            return .blue
        default:
            return .white
        }
    }
    
    var backgroundColor: Gradient {
        switch theme.background {
        case "green-blue":
            return Gradient(colors: [.green, .blue])
        case "orange-black":
            return Gradient(colors: [.orange, .black])
        case "yellow-green":
            return Gradient(colors: [.yellow, .green])
        case "gray-blue":
            return Gradient(colors: [.gray, .blue])
        case "blue-green":
            return Gradient(colors: [.blue, .green])
        default:
            return Gradient(colors: [.white])
        }
    }
    
//    MARK: - Intentions
    func newGame() {
        self.theme = ViewModel.createNewTheme()
        self.model = ViewModel.startGame(theme: theme)
    }
    
    func chose(_ card: Model<String>.Card) {
        model.chose(card)
    }
    
    static let themes: [Theme] = [
        Theme(name: "Animals",
              emoji: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐒", "🐔", "🐣", "🦅", "🦇", "🐺"],
              cardColor: "green",
             background: "green-blue"),
        Theme(name: "Halloween",
              emoji: ["👹", "💀", "🤡", "🤖", "🎃", "👻", "👽", "🥷", "🧟", "🧚‍♀️", "🧜‍♀️", "🧛🏻‍♀️", "🧌", "🦇", "🕷️"],
              cardColor: "orange",
              background: "orange-black"),
        Theme(name: "Food",
              emoji: ["🍏", "🥝", "🍗", "🥓", "🥑", "🍳", "🍕", "🌮", "🍞", "🥐", "🍫"],
              cardColor: "yellow",
              background: "yellow-green"),
        Theme(name: "Numbers",
              emoji: ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟"],
              cardColor: "gray",
              background: "gray-blue"),
        Theme(name: "Countries",
              emoji: ["🇦🇹", "🇦🇬", "🇧🇪", "🇧🇷", "🇧🇴", "🇧🇧", "🇨🇳", "🇨🇦", "🇩🇰", "🇬🇪", "🇲🇰", "🇰🇷" ],
              cardColor: "blue",
              background: "blue-green")
    ]
    static let errorTheme = Theme(name: "Error", emoji: ["🚫"], cardColor: "white", background: "white-white")
}




