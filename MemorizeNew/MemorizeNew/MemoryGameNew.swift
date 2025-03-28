//
//  MemorizeGameNew.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 27.03.2025.
//

import Foundation

struct MemoryGameNew<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add a numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)1b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index] == card {
                return index
            }
        }
        return 0 // FIXME: bogus!
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp = true
        var isMatchedl = false
        var content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id):  \(content) \(isFaceUp ? "up" : "down") \(isMatchedl ? "matched" : "")"
        }
    }
}
