//
//  ThemeDemoView.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 09.03.26.
//

import SwiftUI

struct ThemeDemo: View {
    var theme: Theme
    
    private enum Constants {
        static let lineLimit = 1
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(theme.name)")
                    .font(.headline)
                Text("\(theme.numberOfPairs) pairs of cards")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Text(theme.emoji.joined()).lineLimit(Constants.lineLimit)
        }
    }
    
    init(for theme: Theme) {
        self.theme = theme
    }
}

#Preview {
    ThemeDemo(for: Theme(name: "Animals",
                        emoji: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐒", "🐔", "🐣", "🦅", "🦇", "🐺"],
                        cardColor: Theme.RGBA(red: 0.2, green: 0.8, blue: 0.2, alpha: 1),
                         background: [Theme.RGBA(red: 0.1, green: 0.5, blue: 0.1, alpha: 1), Theme.RGBA(red: 0, green: 0.3, blue: 0.5, alpha: 1)]))
}
