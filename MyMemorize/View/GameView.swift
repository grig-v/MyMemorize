//
//  GameView.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI

struct GameView: View {
    typealias RGBA = Theme.RGBA
    @Environment(ViewModel.self) var viewModel: ViewModel
    
    private enum Constants {
        static let topSpacerMinLength: CGFloat = 60
        static let generalPadding: CGFloat = 5
        static let newGameLabel: String = "New game"
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: Constants.topSpacerMinLength)
            GameInfo(game: viewModel)
                .foregroundStyle(.white)
            Cards(game: viewModel)
                .animation(.bouncy, value: viewModel.cards)
                .foregroundStyle(cardColor)
            newGameButton
        }
        .padding(Constants.generalPadding)
        .ignoresSafeArea()
        .background(backgroundColor)
    }
    
    var newGameButton: some View {
        Button(Constants.newGameLabel) {
            viewModel.newGame()
        }
        .buttonStyle(.glass)
        .padding()
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
    GameView()
        .environment(ViewModel())
}
