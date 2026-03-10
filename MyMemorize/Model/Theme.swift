//
//  Theme.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 19.01.26.
//

import Foundation

struct Theme: Identifiable, Hashable, Codable {
    var name: String
    var emoji: [String] {
        didSet {
            if numberOfPairs > emoji.count {
                numberOfPairs = emoji.count
            }
            if emoji != emoji.uniqued {
                emoji = emoji.uniqued
            }
        }
    }
    var numberOfPairs: Int {
        didSet {
            if numberOfPairs > emoji.count || numberOfPairs < 1 {
                numberOfPairs = oldValue
            }
        }
    }
    var cardColor: RGBA
    var background: [RGBA]
    var id = UUID()
    
    // MARK: - Constants
    private enum Constants {
        static let emptyName: String = ""
        static let emptyPairs: Int = 0
        static let defaultAlpha: Double = 1
    }
    
    init(name: String, emoji: [String], cardColor: RGBA, background: [RGBA]) {
        self.name = name
        self.emoji = emoji.uniqued
        self.numberOfPairs = emoji.count
        self.cardColor = cardColor
        self.background = background
    }
    
    init() {
        name = Constants.emptyName
        emoji = []
        numberOfPairs = Constants.emptyPairs
        cardColor = RGBA()
        background = [RGBA(), RGBA()]
    }
    
    struct RGBA: Codable, Equatable, Hashable {
        let red: Double
        let green: Double
        let blue: Double
        let alpha: Double
        
        init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
                self.red = red
                self.green = green
                self.blue = blue
                self.alpha = alpha
            }
        
        init() {
            self.red = Double.random(in: 0.0...1)
            self.green = Double.random(in: 0.0...1)
            self.blue = Double.random(in: 0.0...1)
            self.alpha = Constants.defaultAlpha
        }
    }
    
    static var builtins: [Theme] = [
        Theme(name: "Animals",
              emoji: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐒", "🐔", "🐣", "🦅", "🦇", "🐺"],
              cardColor: RGBA(red: 0.2, green: 0.8, blue: 0.2),
              background: [RGBA(red: 0.1, green: 0.5, blue: 0.1), RGBA(red: 0, green: 0.3, blue: 0.5)]),
        
        Theme(name: "Halloween",
              emoji: ["👹", "💀", "🤡", "🤖", "🎃", "👻", "👽", "🥷", "🧟", "🧚‍♀️", "🧜‍♀️", "🧛🏻‍♀️", "🧌", "🦇", "🕷️"],
              cardColor: RGBA(red: 1, green: 0.5, blue: 0),
              background: [RGBA(red: 1, green: 0.4, blue: 0), RGBA(red: 0, green: 0, blue: 0)]),
        
        Theme(name: "Food",
              emoji: ["🍏", "🥝", "🍗", "🥓", "🥑", "🍳", "🍕", "🌮", "🍞", "🥐", "🍫"],
              cardColor: RGBA(red: 1, green: 0.9, blue: 0),
              background: [RGBA(red: 1, green: 0.8, blue: 0), RGBA(red: 0.2, green: 0.6, blue: 0)]),
        
        Theme(name: "Numbers",
              emoji: ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟"],
              cardColor: RGBA(red: 0.5, green: 0.5, blue: 0.5),
              background: [RGBA(red: 0.4, green: 0.4, blue: 0.4), RGBA(red: 0, green: 0.2, blue: 0.6)]),
        
        Theme(name: "Countries",
              emoji: ["🇦🇹", "🇦🇬", "🇧🇪", "🇧🇷", "🇧🇴", "🇧🇧", "🇨🇳", "🇨🇦", "🇩🇰", "🇬🇪", "🇲🇰", "🇰🇷" ],
              cardColor: RGBA(red: 0, green: 0.4, blue: 1),
              background: [RGBA(red: 0, green: 0.3, blue: 0.8), RGBA(red: 0, green: 0.7, blue: 0.3)]),
        
        Theme(name: "Space",
              emoji: ["🚀", "🪐", "👨‍🚀", "🛸", "☄️", "🌌", "🛰️", "🔭", "🌍", "🌞", "🌙", "👽"],
              cardColor: RGBA(red: 0.1, green: 0.1, blue: 0.3),
              background: [RGBA(red: 0, green: 0, blue: 0.1), RGBA(red: 0.2, green: 0, blue: 0.4)]),
        
        Theme(name: "Ocean",
              emoji: ["🐙", "🦑", "🦐", "🦞", "🦀", "🐡", "🐠", "🐟", "🐬", "🐳", "🐋", "🦈"],
              cardColor: RGBA(red: 0, green: 0.6, blue: 0.9),
              background: [RGBA(red: 0, green: 0.2, blue: 0.5), RGBA(red: 0, green: 0.8, blue: 0.8)]),
        
        Theme(name: "Sports",
              emoji: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🏒", "🥊"],
              cardColor: RGBA(red: 0.9, green: 0.1, blue: 0.1),
              background: [RGBA(red: 0.6, green: 0, blue: 0), RGBA(red: 0.1, green: 0.1, blue: 0.1)]),
        
        Theme(name: "Weather",
              emoji: ["☀️", "🌤️", "☁️", "🌦️", "🌧️", "⛈️", "🌩️", "🌨️", "❄️", "🌬️", "💨", "🌫️"],
              cardColor: RGBA(red: 0.4, green: 0.7, blue: 1),
              background: [RGBA(red: 0.3, green: 0.5, blue: 0.9), RGBA(red: 0.9, green: 0.9, blue: 0.9)]),
        
        Theme(name: "Nature",
              emoji: ["🌲", "🌵", "🌴", "🌱", "🌿", "☘️", "🍀", "🎍", "🍃", "🍂", "🍁", "🍄"],
              cardColor: RGBA(red: 0.1, green: 0.6, blue: 0.2),
              background: [RGBA(red: 0.05, green: 0.4, blue: 0.1), RGBA(red: 0.5, green: 0.3, blue: 0.1)]),
        
        Theme(name: "Travel",
              emoji: ["✈️", "🚂", "🚢", "🚗", "🚲", "🗺️", "🗽", "🗼", "🏰", "🌋", "🏖️", "⛺️"],
              cardColor: RGBA(red: 0.9, green: 0.6, blue: 0.1),
              background: [RGBA(red: 0.8, green: 0.4, blue: 0), RGBA(red: 0, green: 0.6, blue: 0.7)]),
        
        Theme(name: "Music",
              emoji: ["🎸", "🎹", "🎺", "🎻", "🥁", "🎷", "🎤", "🎧", "🎼", "🎵", "🎶", "📻"],
              cardColor: RGBA(red: 0.6, green: 0.2, blue: 0.8),
              background: [RGBA(red: 0.3, green: 0.1, blue: 0.5), RGBA(red: 0.1, green: 0.1, blue: 0.1)]),
        
        Theme(name: "Insects",
              emoji: ["🦋", "🐌", "🐞", "🐝", "🐜", "🦗", "🕷️", "🦂", "🦟", "🦠", "🐢", "🐍"],
              cardColor: RGBA(red: 0.7, green: 0.8, blue: 0),
              background: [RGBA(red: 0.4, green: 0.5, blue: 0), RGBA(red: 0.2, green: 0.3, blue: 0)]),
        
        Theme(name: "Fruit",
              emoji: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🍍"],
              cardColor: RGBA(red: 1, green: 0.3, blue: 0.3),
              background: [RGBA(red: 0.8, green: 0.1, blue: 0.1), RGBA(red: 1, green: 0.8, blue: 0.2)]),
        
        Theme(name: "Clothing",
              emoji: ["👕", "👖", "👗", "👘", "💄", "👜", "👠", "👟", "🎩", "🧢", "🕶️", "💍"],
              cardColor: RGBA(red: 1, green: 0.5, blue: 0.7),
              background: [RGBA(red: 0.8, green: 0.3, blue: 0.5), RGBA(red: 0.9, green: 0.7, blue: 0.9)]),
        
        Theme(name: "Tools",
              emoji: ["🔨", "⚒️", "🛠️", "⛏️", "⚙️", "🔧", "🪛", "🔩", "🪚", "🪜", "🔦", "🧲"],
              cardColor: RGBA(red: 0.6, green: 0.6, blue: 0.7),
              background: [RGBA(red: 0.4, green: 0.4, blue: 0.5), RGBA(red: 0.2, green: 0.2, blue: 0.2)]),
        
        Theme(name: "Hearts",
              emoji: ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❣️", "💕"],
              cardColor: RGBA(red: 1, green: 0.1, blue: 0.4),
              background: [RGBA(red: 0.6, green: 0, blue: 0.2), RGBA(red: 1, green: 0.8, blue: 0.9)]),
        
        Theme(name: "Veggies",
              emoji: ["🥦", "🥬", "🥕", "🌽", "🌶️", "🫑", "🥒", "🍆", "🍅", "🥔", "🧅", "🧄"],
              cardColor: RGBA(red: 0.5, green: 0.7, blue: 0.2),
              background: [RGBA(red: 0.2, green: 0.4, blue: 0.1), RGBA(red: 0.9, green: 0.8, blue: 0.5)]),
        
        Theme(name: "Games",
              emoji: ["🎮", "🕹️", "🎲", "🧩", "♟️", "🎯", "🎰", "👾", "🃏", "🎭", "🎪", "🎫"],
              cardColor: RGBA(red: 0.2, green: 0.2, blue: 0.8),
              background: [RGBA(red: 0.1, green: 0.1, blue: 0.4), RGBA(red: 0.5, green: 0, blue: 0.5)]),
        
        Theme(name: "Tech",
              emoji: ["💻", "📱", "⌨️", "🖱️", "🖥️", "🖨️", "📷", "📽️", "🎞️", "🔋", "🔌", "📡"],
              cardColor: RGBA(red: 0.4, green: 0.4, blue: 0.45),
              background: [RGBA(red: 0.1, green: 0.1, blue: 0.15), RGBA(red: 0, green: 0.5, blue: 1)])
    ]
}
