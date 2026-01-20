//
//  Theme.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 19.01.26.
//

import Foundation

    struct Theme {
        let name: String
        var emoji: [String]
        let numberOfPairs: Int
        let cardColor: String
        let background: String
        
        init(name: String, emoji: [String], cardColor: String, background: String) {
            self.name = name
            self.emoji = emoji.shuffled()
            self.numberOfPairs = Int.random(in: 3...emoji.count)
            self.cardColor = cardColor
            self.background = background
        }
    }





