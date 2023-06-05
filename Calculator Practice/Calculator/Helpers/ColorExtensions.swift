//
//  ColorExtensions.swift
//  Calculator
//
//  Created by Austin Vesich on 6/4/23.
//

import Foundation
import SwiftUI

extension Color {
    // Return a string with the r, g, b, and a values in a string
    func asString() -> String {
        let color = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a) // This function takes the pointers to the colors and puts the data in them
        
        return "\(r) \(g) \(b) \(a)"
    }
}

extension String {
    // Convert a string with r, g, b, and a values to a color
    func asColor() -> Color {
        var elements = [CGFloat]()
        
        for num in self.components(separatedBy: " ") {
            elements.append(num.asCGFloat())
        }
        
        guard elements.count == 4 else { return .black }
        return Color(uiColor: UIColor(red: elements[0],
                                      green: elements[1],
                                      blue: elements[2],
                                      alpha: elements[3]))
    }
    
    // Convert a string to a CGFloat
    func asCGFloat() -> CGFloat {
        let double = Double(self) ?? 0.0
        return CGFloat(double)
    }
}
