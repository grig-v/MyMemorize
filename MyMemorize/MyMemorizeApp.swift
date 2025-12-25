//
//  MyMemorizeApp.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI

@main
struct MyMemorizeApp: App {
    @State var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: viewModel)
        }
    }
}
