//
//  ContentView.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 22.03.2025.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐷", "🐼", "🐸", "🐹"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
        
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 4)
                Text(content)
                    .font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}



























#Preview {
    ContentView()
}
