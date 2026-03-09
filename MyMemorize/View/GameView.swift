//
//  GameView.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI

struct GameView: View {
    typealias RGBA = Theme.RGBA
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: 60)
            gameInfo
            cards
                .animation(.bouncy, value: viewModel.cards)
                .foregroundStyle(cardColor)
            newGameButton
        }
        .padding(5)
        .ignoresSafeArea()
        .background(backgroundColor)
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: 1) { card in
            CardView(card: card)
                .onTapGesture {
                    viewModel.chose(card)
                }
                .padding(5)
        }
    }
    
    var newGameButton: some View {
        Button("New game") {
            viewModel.newGame()
        }
        .buttonStyle(.glass)
        .padding()
    }
    
    var gameInfo: some View {
        VStack(alignment: .leading) {
            Text(viewModel.theme.name)
                .font(.system(size: 50, weight: .heavy, design: .rounded))
            Text("Score: \(viewModel.score)/\(viewModel.cards.count)")
                .font(.system(size: 30, weight: .heavy, design: .rounded))
        }
        .foregroundStyle(.white)
    }
    
    var cardColor: Color {
        Color(rgba: viewModel.theme.cardColor)
    }
    
    var backgroundColor: Gradient {
        var colors: [Color] = []
        for color in viewModel.theme.background {
            colors.append(Color(rgba: color))
        }
        return Gradient(colors: colors)
    }
    
    
}

#Preview {
    
    GameView(viewModel: ViewModel(theme:   Theme(name: "Animals",
                                                 emoji: ["a", "b", "c", "d", "🐶", "🐱", "🐭"],
                                                 cardColor: Theme.RGBA(red: 0.2, green: 0.8, blue: 0.2, alpha: 1),
                                                 background: [Theme.RGBA(red: 0.1, green: 0.5, blue: 0.1, alpha: 1), Theme.RGBA(red: 0, green: 0.3, blue: 0.5, alpha: 1)])
    ))
}
