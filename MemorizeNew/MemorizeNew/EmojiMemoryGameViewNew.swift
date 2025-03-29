//
//  EmojiMemoryGameViewNew.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 22.03.2025.
//

import SwiftUI

struct EmojiMemoryGameViewNew: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameNew
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let card: MemoryGameNew<String>.Card
    
    init(_ card: MemoryGameNew<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatchedl ? 1 : 0)
    }
}


















#Preview {
    EmojiMemoryGameViewNew(viewModel: EmojiMemoryGameNew())
}
