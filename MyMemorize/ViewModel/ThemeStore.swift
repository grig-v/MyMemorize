//
//  ThemeStore.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 04.03.26.
//

import SwiftUI
import Combine

class ThemeStore: ObservableObject {
    
    @Published var themes: [Theme] = Theme.builtins {
        didSet {
            autosave()
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: autosaveURL), let autosavedThemes = try? JSONDecoder().decode([Theme].self, from: data) {
            if autosavedThemes.isEmpty {
                themes = Theme.builtins
            } else { themes = autosavedThemes
          }
        }
        else {
            print("ThemeStore: Error while decoding data")
        }
    }
    
    //    MARK: - Saving
    private let autosaveURL: URL = URL.documentsDirectory.appending(path: "Autosaved.Theme")
    
    private func autosave() {
        save(to: autosaveURL)
    }
    
    private func save(to url: URL) {
        do {
            let data = try JSONEncoder().encode(themes)
            try data.write(to: url)
        } catch {
            print("ThemeStore: Error while saving: \(error.localizedDescription)")
        }
    }
}



