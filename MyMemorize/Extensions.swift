//
//  Extensions.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 06.03.26.
//

import Foundation
import SwiftUI

extension Array where Element: Equatable {
    var uniqued: Array {
        reduce(into: []) { result, element in
            if !result.contains(where: { $0 == element }) {
                result.append(element)
            }
        }
    }
}

extension Array where Element == String {
    mutating func remove(_ str: String) {
        removeAll(where: { $0 == str })
    }
}

extension Color {
    init(rgba: Theme.RGBA) {
        self.init(red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
    }
}

extension Theme.RGBA {
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        if UIColor(color).getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
        } else {
            print("ThemeStore: init RGBA error")
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }
}



