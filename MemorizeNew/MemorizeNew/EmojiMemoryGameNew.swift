//
//  EmojiMemoryGameNew.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 27.03.2025.
//

import SwiftUI

class EmojiMemoryGameNew: ObservableObject {
    typealias Card = MemoryGameNew<String>.Card
    
    private static let emojis = ["🐷", "🐼", "🐸", "🐹", "🐥", "🐧", "🦊", "🐶", "🐱", "🐰", "🦁", "🐮"]
    
    private static func createMemoryGameNew() -> MemoryGameNew<String> {
        return MemoryGameNew(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
        
    @Published private var model = createMemoryGameNew()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
         .orange
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: -Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
