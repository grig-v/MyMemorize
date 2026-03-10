//
//  Cards.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 09.03.26.
//

import SwiftUI

struct Cards: View {
    var game: ViewModel
    
    private enum Constants {
        static let aspectRatio: CGFloat = 1
        static let padding: CGFloat = 5
    }
    
    var body: some View {
        AspectVGrid(game.cards, aspectRatio: Constants.aspectRatio) { card in
            CardView(card: card)
                .onTapGesture {
                    game.chose(card)
                }
                .padding(Constants.padding)
        }
    }
}

#Preview {
    Cards(game: ViewModel())
}
