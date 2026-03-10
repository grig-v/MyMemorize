//
//  GameInfo.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 09.03.26.
//

import SwiftUI

struct GameInfo: View {
    var game: ViewModel
    
    private enum Constants {
        static let titleSize: CGFloat = 50
        static let scoreSize: CGFloat = 30
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(game.theme.name)
                .font(.system(size: Constants.titleSize, weight: .heavy, design: .rounded))
            Text("Score: \(game.score)/\(game.cards.count)")
                .font(.system(size: Constants.scoreSize, weight: .heavy, design: .rounded))
        }
    }
}

#Preview {
    GameInfo(game: ViewModel())
}
