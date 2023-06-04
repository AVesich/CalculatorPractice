//
//  ViewExtensions.swift
//  Calculator
//
//  Created by Austin Vesich on 5/31/23.
//

import Foundation
import SwiftUI

extension View {
    // Inner shadow modifier - Radius is the first and only necessary argument, so I made it hidden. Tint and the offsets are all optional, so they have default values provided.
    func innerShadow(_ radius: CGFloat, tint: Color = .black, opacity: CGFloat = 0.2, offsetX: CGFloat = 0.0, offsetY: CGFloat = 0.0) -> some View {
        return self
            .compositingGroup()
            .background(
                tint
                    .opacity(opacity)
                    .overlay {
                        Color.white
                            .mask(self)
                                .blur(radius: radius)
                                .offset(x: offsetX, y: offsetY)
                    }
                    .mask(self)
                    .compositingGroup()
            )
            .blendMode(.multiply)
            .compositingGroup()
    }
}
