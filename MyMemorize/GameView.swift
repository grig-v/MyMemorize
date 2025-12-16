//
//  GameView.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI

struct GameView: View {
    
    @State var emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐒", "🐔", "🐣", "🦅", "🦇", "🐺"]
    
    var body: some View {
        
        VStack {
            ScrollView {
                let columns: [GridItem] = [
                    GridItem(),
                    GridItem(),
                    GridItem()
                ]
                LazyVGrid(columns: columns) {
                    ForEach(emojis.indices) { emojiIndex in
                        CardView(content: emojis[emojiIndex])
                    }
                }
            }
            shuffleButton
                .buttonStyle(.bordered)
            
        }
        .padding()
        .foregroundStyle(.blue)
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    var shuffleButton: some View {
        Button("Shuffle") {
            emojis.shuffle()
        }
    }
}



struct CardView: View {
    @State var isFaceUp = true
    var content: String
    
    var body: some View {
        
        let base = Circle()
        ZStack {
            if isFaceUp {
                base
                    .stroke()
                Text(content)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    GameView()
}
