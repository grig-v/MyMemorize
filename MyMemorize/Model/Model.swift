//
//  Model.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import Foundation

struct Model<CardContent> where CardContent : Equatable {
    
    private(set) var cards: [Card]
    private(set) var score = 0
    
    init (numberOfPairs: Int, cardFactory: (Int) -> CardContent) {
        self.cards = []
        for pairIndex in 0..<max(2, numberOfPairs) {
            let content = cardFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        cards.shuffle()
    }
    
    var FirstAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp == true }.only }
        set { cards.indices.forEach {
            if cards[$0].isFaceUp == true {
                cards[$0].wasShown = true // отмечаем, пару карт, которые только что просмотрели
            }
            cards[$0].isFaceUp = (newValue == $0)
        }
      }
    }
    
    mutating func scoreCounter(firstCard: Card, secondCard: Card) {
        let cards = [firstCard, secondCard]
        if firstCard.content != secondCard.content  {
            for card in cards {
                if card.wasShown {
                    score -= 1
                }
            }
        } else {
            score += 2
        }
    }
    
    mutating func chose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatch {
                if let potentialMatchInd = FirstAndOnlyFaceUpCard {
                    scoreCounter(firstCard: cards[chosenIndex], secondCard: cards[potentialMatchInd])
                    if cards[potentialMatchInd].content == cards[chosenIndex].content {
                        cards[potentialMatchInd].isMatch = true
                        cards[chosenIndex].isMatch = true
                    }
                } else {
                    FirstAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
                print(cards)
            }
        }
    }
    
    struct Card: Identifiable, CustomDebugStringConvertible, Equatable {
        var debugDescription: String {
            return "\(content), match: \(isMatch), \(isFaceUp ? "Up" : "Down"), \(wasShown ? "👀" : "")"
        }
        
        let content: CardContent
        var isFaceUp = false
        var isMatch = false
        var wasShown = false
        let id = UUID()
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}


