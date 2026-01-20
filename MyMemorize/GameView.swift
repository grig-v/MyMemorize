//
//  GameView.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
            VStack {
                    Spacer(minLength: 60)
                gameInfo
                    cards
                        .animation(.bouncy, value: viewModel.cards)
                        .foregroundStyle(viewModel.themeColor)
                newGameButton
            }
            .padding(5)
            .ignoresSafeArea()
            .background(viewModel.backgroundColor)
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cards, aspectRario: 1) { card in
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
}

#Preview {
    GameView(viewModel: ViewModel())
}
