//
//  ThemeChooser.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 05.03.26.
//

import SwiftUI

struct ThemeChooser: View {
    @ObservedObject var store: ThemeStore
    @State private var themeToEdit: Theme?
    
    var body: some View {
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
                    .listRowBackground(
                        LinearGradient(colors: [Color(rgba: theme.cardColor), .white], startPoint: .trailing, endPoint: .leading))
                }
                
                .onDelete { indexSet in
                    store.themes.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Chose a theme")
            .navigationDestination(for: Theme.self) { theme in
                if let index = store.themes.firstIndex(where: { $0.id == theme.id }) {
                    GameView(viewModel: ViewModel(theme: store.themes[index]))
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
    
    var errorView: some View {
        Text("Error")
    }
}

struct ThemeDemo: View {
    var theme: Theme
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(theme.name)")
                    .font(.headline)
                Text("\(theme.numberOfPairs) pairs of cards")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Text(theme.emoji.joined()).lineLimit(1)
        }
    }
    
    init(for theme: Theme) {
        self.theme = theme
    }
}

#Preview {
    ThemeChooser(store: ThemeStore())
}
