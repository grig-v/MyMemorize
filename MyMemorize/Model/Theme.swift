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
    var numberOfPairs: Int
    var cardColor: RGBA
    var background: [RGBA]
    var id = UUID()
    
    init(name: String, emoji: [String], cardColor: RGBA, background: [RGBA]) {
        self.name = name
        self.emoji = emoji.uniqued
        self.numberOfPairs = emoji.count
        self.cardColor = cardColor
        self.background = background
    }
    
    init() {
        name = ""
        emoji = []
        numberOfPairs = 0
        cardColor = RGBA(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        background = []
    }
    
    mutating func increment() {
        if emoji.count > numberOfPairs {
            numberOfPairs += 1
        }
    }
    
    mutating func decrement() {
        if emoji.count > 1 && numberOfPairs > 1 {
            numberOfPairs -= 1
        }
    }
    
    struct RGBA: Codable, Equatable, Hashable {
        let red: Double
        let green: Double
        let blue: Double
        let alpha: Double
    }
    
    static var builtins: [Theme] = [
        Theme(name: "Animals",
              emoji: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐒", "🐔", "🐣", "🦅", "🦇", "🐺"],
              cardColor: RGBA(red: 0.2, green: 0.8, blue: 0.2, alpha: 1),
              background: [RGBA(red: 0.1, green: 0.5, blue: 0.1, alpha: 1), RGBA(red: 0, green: 0.3, blue: 0.5, alpha: 1)]),
        
        Theme(name: "Halloween",
              emoji: ["👹", "💀", "🤡", "🤖", "🎃", "👻", "👽", "🥷", "🧟", "🧚‍♀️", "🧜‍♀️", "🧛🏻‍♀️", "🧌", "🦇", "🕷️"],
              cardColor: RGBA(red: 1, green: 0.5, blue: 0, alpha: 1),
              background: [RGBA(red: 1, green: 0.4, blue: 0, alpha: 1), RGBA(red: 0, green: 0, blue: 0, alpha: 1)]),
        
        Theme(name: "Food",
              emoji: ["🍏", "🥝", "🍗", "🥓", "🥑", "🍳", "🍕", "🌮", "🍞", "🥐", "🍫"],
              cardColor: RGBA(red: 1, green: 0.9, blue: 0, alpha: 1),
              background: [RGBA(red: 1, green: 0.8, blue: 0, alpha: 1), RGBA(red: 0.2, green: 0.6, blue: 0, alpha: 1)]),
        
        Theme(name: "Numbers",
              emoji: ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟"],
              cardColor: RGBA(red: 0.5, green: 0.5, blue: 0.5, alpha: 1),
              background: [RGBA(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), RGBA(red: 0, green: 0.2, blue: 0.6, alpha: 1)]),
        
        Theme(name: "Countries",
              emoji: ["🇦🇹", "🇦🇬", "🇧🇪", "🇧🇷", "🇧🇴", "🇧🇧", "🇨🇳", "🇨🇦", "🇩🇰", "🇬🇪", "🇲🇰", "🇰🇷" ],
              cardColor: RGBA(red: 0, green: 0.4, blue: 1, alpha: 1),
              background: [RGBA(red: 0, green: 0.3, blue: 0.8, alpha: 1), RGBA(red: 0, green: 0.7, blue: 0.3, alpha: 1)]),
        Theme(name: "Space",
              emoji: ["🚀", "🪐", "👨‍🚀", "🛸", "☄️", "🌌", "🛰️", "🔭", "🌍", "🌞", "🌙", "👽"],
              cardColor: RGBA(red: 0.1, green: 0.1, blue: 0.3, alpha: 1),
              background: [RGBA(red: 0, green: 0, blue: 0.1, alpha: 1), RGBA(red: 0.2, green: 0, blue: 0.4, alpha: 1)]),
        
        Theme(name: "Ocean",
              emoji: ["🐙", "🦑", "🦐", "🦞", "🦀", "🐡", "🐠", "🐟", "🐬", "🐳", "🐋", "🦈"],
              cardColor: RGBA(red: 0, green: 0.6, blue: 0.9, alpha: 1),
              background: [RGBA(red: 0, green: 0.2, blue: 0.5, alpha: 1), RGBA(red: 0, green: 0.8, blue: 0.8, alpha: 1)]),
        
        Theme(name: "Sports",
              emoji: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🏒", "🥊"],
              cardColor: RGBA(red: 0.9, green: 0.1, blue: 0.1, alpha: 1),
              background: [RGBA(red: 0.6, green: 0, blue: 0, alpha: 1), RGBA(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)]),
        
        Theme(name: "Weather",
              emoji: ["☀️", "🌤️", "☁️", "🌦️", "🌧️", "⛈️", "🌩️", "🌨️", "❄️", "🌬️", "💨", "🌫️"],
              cardColor: RGBA(red: 0.4, green: 0.7, blue: 1, alpha: 1),
              background: [RGBA(red: 0.3, green: 0.5, blue: 0.9, alpha: 1), RGBA(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)]),
        
        Theme(name: "Nature",
              emoji: ["🌲", "🌵", "🌴", "🌱", "🌿", "☘️", "🍀", "🎍", "🍃", "🍂", "🍁", "🍄"],
              cardColor: RGBA(red: 0.1, green: 0.6, blue: 0.2, alpha: 1),
              background: [RGBA(red: 0.05, green: 0.4, blue: 0.1, alpha: 1), RGBA(red: 0.5, green: 0.3, blue: 0.1, alpha: 1)]),
        
        Theme(name: "Travel",
              emoji: ["✈️", "🚂", "🚢", "🚗", "🚲", "🗺️", "🗽", "🗼", "🏰", "🌋", "🏖️", "⛺️"],
              cardColor: RGBA(red: 0.9, green: 0.6, blue: 0.1, alpha: 1),
              background: [RGBA(red: 0.8, green: 0.4, blue: 0, alpha: 1), RGBA(red: 0, green: 0.6, blue: 0.7, alpha: 1)]),
        
        Theme(name: "Music",
              emoji: ["🎸", "🎹", "🎺", "🎻", "🥁", "🎷", "🎤", "🎧", "🎼", "🎵", "🎶", "📻"],
              cardColor: RGBA(red: 0.6, green: 0.2, blue: 0.8, alpha: 1),
              background: [RGBA(red: 0.3, green: 0.1, blue: 0.5, alpha: 1), RGBA(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)]),
        
        Theme(name: "Insects",
              emoji: ["🦋", "🐌", "🐞", "🐝", "🐜", "🦗", "🕷️", "🦂", "🦟", "🦠", "🐢", "🐍"],
              cardColor: RGBA(red: 0.7, green: 0.8, blue: 0, alpha: 1),
              background: [RGBA(red: 0.4, green: 0.5, blue: 0, alpha: 1), RGBA(red: 0.2, green: 0.3, blue: 0, alpha: 1)]),
        
        Theme(name: "Fruit",
              emoji: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🍍"],
              cardColor: RGBA(red: 1, green: 0.3, blue: 0.3, alpha: 1),
              background: [RGBA(red: 0.8, green: 0.1, blue: 0.1, alpha: 1), RGBA(red: 1, green: 0.8, blue: 0.2, alpha: 1)]),
        
        Theme(name: "Clothing",
              emoji: ["👕", "👖", "👗", "👘", "💄", "👜", "👠", "👟", "🎩", "🧢", "🕶️", "💍"],
              cardColor: RGBA(red: 1, green: 0.5, blue: 0.7, alpha: 1),
              background: [RGBA(red: 0.8, green: 0.3, blue: 0.5, alpha: 1), RGBA(red: 0.9, green: 0.7, blue: 0.9, alpha: 1)]),
        
        Theme(name: "Tools",
              emoji: ["🔨", "⚒️", "🛠️", "⛏️", "⚙️", "🔧", "🪛", "🔩", "🪚", "🪜", "🔦", "🧲"],
              cardColor: RGBA(red: 0.6, green: 0.6, blue: 0.7, alpha: 1),
              background: [RGBA(red: 0.4, green: 0.4, blue: 0.5, alpha: 1), RGBA(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]),
        
        Theme(name: "Hearts",
              emoji: ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❣️", "💕"],
              cardColor: RGBA(red: 1, green: 0.1, blue: 0.4, alpha: 1),
              background: [RGBA(red: 0.6, green: 0, blue: 0.2, alpha: 1), RGBA(red: 1, green: 0.8, blue: 0.9, alpha: 1)]),
        
        Theme(name: "Veggies",
              emoji: ["🥦", "🥬", "🥕", "🌽", "🌶️", "🫑", "🥒", "🍆", "🍅", "🥔", "🧅", "🧄"],
              cardColor: RGBA(red: 0.5, green: 0.7, blue: 0.2, alpha: 1),
              background: [RGBA(red: 0.2, green: 0.4, blue: 0.1, alpha: 1), RGBA(red: 0.9, green: 0.8, blue: 0.5, alpha: 1)]),
        
        Theme(name: "Games",
              emoji: ["🎮", "🕹️", "🎲", "🧩", "♟️", "🎯", "🎰", "👾", "🃏", "🎭", "🎪", "🎫"],
              cardColor: RGBA(red: 0.2, green: 0.2, blue: 0.8, alpha: 1),
              background: [RGBA(red: 0.1, green: 0.1, blue: 0.4, alpha: 1), RGBA(red: 0.5, green: 0, blue: 0.5, alpha: 1)]),
        
        Theme(name: "Tech",
              emoji: ["💻", "📱", "⌨️", "🖱️", "🖥️", "🖨️", "📷", "📽️", "🎞️", "🔋", "🔌", "📡"],
              cardColor: RGBA(red: 0.4, green: 0.4, blue: 0.45, alpha: 1),
              background: [RGBA(red: 0.1, green: 0.1, blue: 0.15, alpha: 1), RGBA(red: 0, green: 0.5, blue: 1, alpha: 1)])
    ]
}





