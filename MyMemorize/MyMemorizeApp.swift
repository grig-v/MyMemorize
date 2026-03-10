//
//  MyMemorizeApp.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.12.25.
//

import SwiftUI

@main
struct MyMemorizeApp: App {
    @State var themeStore = ThemeStore()
    
    var body: some Scene {
        WindowGroup {
            ThemeChooser()
                .environment(themeStore)
        }
    }
}
