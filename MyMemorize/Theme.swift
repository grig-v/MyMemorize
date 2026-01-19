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
        let color: String
        
        init(name: String, emoji: [String], color: String) {
            self.name = name
            self.emoji = emoji.shuffled()
            self.numberOfPairs = Int.random(in: 2...emoji.count)
            self.color = color
        }
    }





