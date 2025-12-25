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
            ScrollView {
                Spacer(minLength: 60)
                HStack {
                    Text("My Memorize")
                        .font(.system(size: 40, weight: .black, design: .rounded))
                    Spacer()
                }
                cards
                    .animation(.interactiveSpring, value: viewModel.cards)
            }
            shuffleButton
                .buttonStyle(.bordered)
            
        }
        .padding(5)
        .foregroundStyle(.blue)
        .ignoresSafeArea()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        viewModel.chose(card)
                    }
            }
            .padding(5)
        }
    }
    
    var shuffleButton: some View {
        Button("Shuffle") {
            viewModel.shuffle()
        }
        .font(.system(size: 30, weight: .black, design: .rounded))
    }
    
    struct CardView: View {
        var card: Model<String>.Card
        
        var body: some View {
            let base = Circle()
            ZStack {
                if card.isFaceUp {
                    base
                        .stroke(lineWidth: 1.5)
                    Text(card.content)
                        .font(.system(size: 50))
                } else {
                    base
                }
            }
            .opacity(!card.isMatch || card.isFaceUp ? 1 : 0.2)
        }
    }
}

#Preview {
    GameView(viewModel: ViewModel())
}
