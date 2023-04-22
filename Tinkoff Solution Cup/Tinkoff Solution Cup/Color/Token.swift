//
//  Color.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

import UIKit

class Token {
    
    // MARK: Label
    private static let header = UIColor(hex: 0x333333)
    
    private static let title = UIColor(hex: 0x333333)
    
    private static let subtitle = UIColor(hex: 0x9299A2)

    // MARK: Button
    private static let button = UIColor(hex: 0x428BF9)
    
    private static let selectedButton = UIColor(hex: 0x001024)
    
    // MARK: View
    private static let view = UIColor(hex: 0xFFFFFF)
    
    private static let selectedView = UIColor(hex: 0xF6F7F8)
    
    private static let shadowView = UIColor(hex: 0x000000).withAlphaComponent(0.12)
    
    private static let backgroundImage = UIColor(hex: 0x428BF9)
    
    
}

extension Token {
    class Color {
        static let backgroundImage = Token.backgroundImage
        
        static let header = Token.header
        static let title = Token.title
        static let subtitle = Token.subtitle
        
        static let button = Token.button
        static let buttonSelected = Token.selectedButton
        static let buttonDelete = Token.selectedView
        
        static let view = Token.view
        static let selectedView = Token.selectedView
        static let shadowView = Token.selectedView
    }
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension CGColor {
    class func colorWithHex(hex: Int) -> CGColor {
        return UIColor(hex: hex).cgColor
    }
}
