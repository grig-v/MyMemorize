//
//  ThemeChooser.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 05.03.26.
//

import SwiftUI

struct ThemeChooser: View {
    @Environment(ThemeStore.self) var store
    @State private var themeToEdit: Theme?
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        @Bindable var store = store
        NavigationStack {
            List {
                ForEach(store.themes) { theme in
                    NavigationLink(value: theme) {
                        ThemeDemo(for: theme)
                            .swipeActions(edge: .leading) {
                                Button(action: {
                                    themeToEdit = theme
                                }, label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                })
                                .tint(.blue)
                            }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(linearGradient(for: theme))
                }
                
                .onDelete { indexSet in
                    store.themes.remove(atOffsets: indexSet)
                }
            }
            .scrollContentBackground(.hidden)
            .background(gradientBackground)
            .navigationTitle("Chose a theme")
            .navigationDestination(for: Theme.self) { theme in
                if let index = store.themes.firstIndex(where: { $0.id == theme.id }) {
                    @State var game = ViewModel(theme: store.themes[index])
                    GameView()
                        .environment(game)
                } else {
                    errorView
                }
            }
            .toolbar {
                Button("Add") {
                    store.themes.insert(Theme(), at: 0)
                    themeToEdit = store.themes[0]
                }
            }
            .sheet(item: $themeToEdit) { themeToEdit in
                if let index = store.themes.firstIndex(where: { $0.id == themeToEdit.id }) {
                    NavigationStack {
                        ThemeEditor(theme: $store.themes[index])
                            .toolbar {
                                Button("Done") {
                                    self.themeToEdit = nil
                                }
                            }
                    }
                } else {
                    errorView
                }
            }
        }
    }
    
    private var errorView: some View {
        Text("Error")
    }
    
    private func linearGradient(for theme: Theme) -> some View {
        LinearGradient(colors: [Color(rgba: theme.cardColor), colorScheme.isLight ? .white : .black],
                       startPoint: .trailing, endPoint: .leading)
    }
    
    private var gradientBackground: Gradient {
        if colorScheme == .light {
            Gradient(colors: [.blue, .white])
        } else {
            Gradient(colors: [.indigo, .black])
        }
    }
}

#Preview {
    ThemeChooser()
        .environment(ThemeStore())
}
