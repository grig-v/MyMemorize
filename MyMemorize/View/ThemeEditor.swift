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
    
    private enum Constants {
        static let shadowRadius: CGFloat = 7
        static let gridItemMinimum: CGFloat = 40
        static let stepperFormat = "Pairs in the game: %d"
    }
    
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
                Stepper(String(format: "Pairs in the game: \(theme.numberOfPairs)", theme.numberOfPairs),
                        onIncrement: { theme.numberOfPairs += 1 },
                        onDecrement: { theme.numberOfPairs -= 1 }
                )
            }
            Section {
                ColorPicker("Change cards color", selection: rgbaProxy)
            }
        }
        .shadow(color: .white, radius: Constants.shadowRadius)
        .scrollContentBackground(.hidden)
        .background(Gradient(colors: [Color(rgba: theme.cardColor), .white]))
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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: Constants.gridItemMinimum))]) {
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
    @Previewable @State var previewTheme = Theme()
    NavigationStack {
        ThemeEditor(theme: $previewTheme)
    }
}
