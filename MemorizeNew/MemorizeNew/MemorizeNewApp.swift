//
//  MemorizeNewApp.swift
//  MemorizeNew
//
//  Created by Александр Шульга on 22.03.2025.
//

import SwiftUI

@main
struct MemorizeNewApp: App {
    @StateObject var gameNew = EmojiMemoryGameNew()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameViewNew(viewModel: gameNew)
        }
    }
}
