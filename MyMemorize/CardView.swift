//
//  CardView.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 14.01.26.
//
import SwiftUI

    struct CardView: View {
        var card: Model<String>.Card
        
        var body: some View {
            let base = Circle()
            ZStack {
                if card.isFaceUp {
                    base
                        .glassEffect(.clear.interactive())
                    Text(card.content)
                        .font(.system(size: 50))
                        
                } else {
                    base
                        .glassEffect(.regular.interactive())
                }
            }
            .opacity(!card.isMatch || card.isFaceUp ? 1 : 0.2)
        }
    }
