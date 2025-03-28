//
//  EmojiMemoryGameNew.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 27.03.2025.
//

import SwiftUI

class EmojiMemoryGameNew: ObservableObject {
    private static let emojis = ["🐷", "🐼", "🐸", "🐹", "🐥", "🐧", "🦊", "🐶", "🐱", "🐰", "🦁", "🐮"]
    
    private static func createMemoryGameNew() -> MemoryGameNew<String> {
        return MemoryGameNew(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
        
    @Published private var model = createMemoryGameNew()
    
    var cards: Array<MemoryGameNew<String>.Card> {
        model.cards
    }
    
    // MARK: -Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGameNew<String>.Card) {
        model.choose(card)
    }
}
