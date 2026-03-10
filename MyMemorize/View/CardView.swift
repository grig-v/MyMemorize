//
//  CardView.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 14.01.26.
//
import SwiftUI

struct CardView: View {
    var card: Model<String>.Card
    
    private enum Constants {
        static let fontSize: CGFloat = 50
        static let matchedOpacity: Double = 0.2
        static let fullOpacity: Double = 1.0
    }
    
    var body: some View {
        let base = Circle()
        ZStack {
            if card.isFaceUp {
                base
                    .glassEffect(.clear.interactive())
                Text(card.content)
                    .font(.system(size: Constants.fontSize))
                    .foregroundStyle(.black)
                    
            } else {
                base
                    .glassEffect(.regular.interactive())
            }
        }
        .opacity(!card.isMatch || card.isFaceUp ? Constants.fullOpacity : Constants.matchedOpacity)
    }
}
