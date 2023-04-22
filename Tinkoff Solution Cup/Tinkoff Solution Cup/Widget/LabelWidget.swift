//
//  LabelWidget.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

import UIKit

public class LabelWidget: Label {
    
    private var numbers: Int?
    
    private var style: Label.Style = .title
    
    private func setup() {
        switch style {
        case .title:
            self.textColor = Token.Color.title
            self.numberOfLines = 1
            self.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        case .subtitle:
            self.textColor = Token.Color.subtitle
            self.numbers = 2
            self.font = UIFont(name: "SFProText-Regular", size: 15)
        case .button:
            self.textColor = Token.Color.button
            self.numberOfLines = 1
            self.font = UIFont(name: "SFProText-Regular", size: 15)
        }
        
        if let numbers {
            self.numberOfLines = numbers
        }
    }
    
    override init(text: String,
                  style: Label.Style,
                  numberOfLines: Int = -1) {
        super.init(text: text, style: style, numberOfLines: numberOfLines)
        
        self.style = style
        self.numbers = numberOfLines
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
