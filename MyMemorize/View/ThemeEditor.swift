//
//  ThemeEditor.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 05.03.26.
//

import SwiftUI

struct ThemeEditor: View {
    @Binding var theme: Theme
    @State var emojisToAdd = ""
    @FocusState private var focus: Focus?
    
    enum Focus {
        case name, addEmojis
    }
    
    var body: some View {
        let rgbaProxy = Binding<Color>(
            get: { Color(rgba: theme.cardColor) },
            set: { theme.cardColor = Theme.RGBA(color: $0) }
        )
        
        Form {
            nameEditor
            adderRemoverEmojis
            Section {
                Stepper("Pairs in the game: \(theme.numberOfPairs)",
                        onIncrement: { theme.increment() },
                        onDecrement: { theme.decrement() }
                )
            }
            Section {
                ColorPicker("Change cards color", selection: rgbaProxy)
            }
//            TODO: background editor
        }
        .shadow(color: .white.opacity(2), radius: 7)
        .scrollContentBackground(.hidden)
        .background(Gradient(colors: [Color(rgba: theme.cardColor).opacity(0.8), .white]))
        .navigationTitle("Editor: \(theme.name)")
    }
    
    private var nameEditor: some View {
        Section(content: {
            TextField("Name", text: $theme.name)
                .focused($focus, equals: .name)
                .submitLabel(.continue)
                .onSubmit {
                    focus = .addEmojis
                }
        }, header: {
            Text("Name of the theme")
        }, footer: {
            Text("Edit the name for the theme or create your own.")
        })
    }
    
    private var adderRemoverEmojis: some View {
        // add
        Section(content: {
            TextField("Add some emojis here", text: $emojisToAdd)
                .focused($focus, equals: .addEmojis)
                .submitLabel(.done)
                .onSubmit {
                    let newEmojis = emojisToAdd.split(separator: "").map(String.init)
                    theme.emoji.insert(contentsOf: newEmojis, at: 0)
                    emojisToAdd = ""
                    focus = nil
                }
            // remove
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(theme.emoji, id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            withAnimation {
                                theme.emoji.remove(emoji)
                            }
                        }
                }
            }
        }, header: {
            Text("Adding emojis")
        }, footer: {
            Text("Tap to remove")
        })
    }
}

#Preview {
    @Previewable @State var previewTheme = Theme(name: "Жопка", emoji: ["🍏", "🥝", "🍗", "🥓", "🥑", "🍳", "🍕", "🌮", "🍞", "🥐", "🍫"], cardColor: Theme.RGBA(red: 1, green: 0.9, blue: 0, alpha: 1), background: [Theme.RGBA(red: 1, green: 1, blue: 1, alpha: 1)])
    NavigationStack {
        ThemeEditor(theme: $previewTheme)
    }
}
