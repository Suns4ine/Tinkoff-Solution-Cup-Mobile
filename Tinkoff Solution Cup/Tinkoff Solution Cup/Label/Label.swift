//
//  Label.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

import UIKit

public class Label: UILabel {
    
    private var numbers: Int?
    private var style: Label.Style = .title
    
    init(text: String,
         style: Label.Style,
         numberOfLines: Int = -1) {
        super.init(frame: .zero)
        
        self.text = text
        self.style = style
        numbers = numberOfLines
        
        setup()
    }
    
    private func setup() {
        switch style {
        case .button:
            self.textColor = Token.Color.button
            self.numberOfLines = 1
            self.font = UIFont(name: "SFProText-Regular", size: 15)
        case .title:
            self.textColor = Token.Color.title
            self.numberOfLines = 2
            self.font = UIFont(name: "SFProText-Regular", size: 17)
        case .subtitle:
            self.textColor = Token.Color.subtitle
            self.numbers = 0
            self.font = UIFont(name: "SFProText-Regular", size: 15)
        }
        
        self.textAlignment = .left
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let numbers {
            self.numberOfLines = numbers
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Label {
    
    public enum Style {
        case title
        case subtitle
        case button
    }
}

private extension Label {
    enum Constant {
        static let height: CGFloat = 40
        static let width: CGFloat = 40
        
        static let indent: CGFloat = 8
    }
}
