//
//  CardView.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 29.03.2025.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGameNew<String>.Card
    
    init(_ card: MemoryGameNew<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(startAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatchedl ? 1 : 0)
    }
    
    
    private struct Constants {
        static let inset: CGFloat = 5

        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = MemoryGameNew<String>.Card
    
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(isFaceUp: true, content: "X", id: "test1"))
                CardView(Card(content: "X", id: "test1"))
            }
            HStack {
                CardView(Card(isFaceUp: true, isMatchedl: true, content: "X", id: "test1"))
                CardView(Card(isMatchedl: true, content: "X", id: "test1"))
            }
        }
        .padding()
        .foregroundColor(.green)
    }
}
