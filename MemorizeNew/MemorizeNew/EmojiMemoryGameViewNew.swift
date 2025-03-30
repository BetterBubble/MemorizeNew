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
    private let spacer: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
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
                .padding(spacer)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}



















#Preview {
    EmojiMemoryGameViewNew(viewModel: EmojiMemoryGameNew())
}
