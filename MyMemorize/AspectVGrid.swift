//
//  AspectVGrid.swift
//  MyMemorize
//
//  Created by Barborisss Macaroni on 16.01.26.
//


import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat = 1
    var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: items.count,
                                                     size: geometry.size,
                                                     atAspectRatio: aspectRatio
            )
            if gridItemSize > 0 {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize, maximum: .infinity), spacing: 0)] , spacing: 0) {
                    ForEach(items) { item in
                        content(item)
                            .aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
            }
        }
    }
    
    func gridItemWidthThatFits(
        count: Int, // cards.count
        size: CGSize, // width and height of the container
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        guard count > 0, size.width > 0, size.height > 0 else { return 0 }
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount // ширина карточки
            let heigh = width / aspectRatio // высота карточки
            
            let rowCount = (count / columnCount).rounded(.up) // колличество строк
            if rowCount * heigh < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        } while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}
