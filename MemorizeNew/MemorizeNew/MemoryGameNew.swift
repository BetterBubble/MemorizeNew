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
    
    var indexOfTheOnlyCardFaceDown: Int? {
        get { return cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { return cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatchedl {
                if let potentialMatchedIndex = indexOfTheOnlyCardFaceDown {
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content {
                        cards[chosenIndex].isMatchedl = true
                        cards[potentialMatchedIndex].isMatchedl = true
                    }
                } else {
                    indexOfTheOnlyCardFaceDown = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp = false
        var isMatchedl = false
        var content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id):  \(content) \(isFaceUp ? "up" : "down") \(isMatchedl ? "matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
