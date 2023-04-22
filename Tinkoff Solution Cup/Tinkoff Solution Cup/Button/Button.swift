//
//  Button.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//


import UIKit

public class Button: UIButton {
    
    var closure: (() -> (Void))?
    
    let label: Label = {
        let label = Label(text: "", style: .button)
        label.textAlignment = .center
        return label
    }()
    
    init(text: String?,
         closure: (() -> (Void))?) {
        super.init(frame: .zero)
        label.text = text
        
        setup()
    }
    
    private func setup() {
        [label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        self.backgroundColor = Token.Color.button
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(didTouchDown), for: .touchDown)
        self.addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
    }
    
    @objc
    private func didTouchDown() {
        self.backgroundColor = Token.Color.buttonSelected
    }
    
    @objc
    private func didTouchUpInside() {
        self.backgroundColor = Token.Color.button
        closure?()
    }
    
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: Button.Constant.vertical),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Button.Constant.vertical),
            
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Button.Constant.horizontal),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Button.Constant.horizontal)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension Button {
    enum Constant {
        static let horizontal: CGFloat = 8
        static let vertical: CGFloat = 10
    }
}
