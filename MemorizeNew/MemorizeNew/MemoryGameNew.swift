//
//  MemorizeGameNew.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 27.03.2025.
//

import Foundation

struct MemorizeGameNew<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
        
    }
}
