//
//  Widget.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

import UIKit

public final class Widget: UIView {
    
    public var isHighlighted = false {
        didSet {
            update()
        }
    }
    
    public let title: LabelWidget = {
        let label = LabelWidget(text: "", style: .title)
        return label
    }()
    
    public let subtitle: LabelWidget = {
        let label = LabelWidget(text: "", style: .subtitle)
        return label
    }()
    
    public let image: Image = {
        let image = Image(name: .default)
        return image
    }()
    
    public let button: Button = {
        let button = Button(text: "", closure: nil)
        return button
    }()
    
    private let textStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = Widget.Constant.textStack
        return view
     }()
    
    private let horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = Widget.Constant.horizontal
        return view
    }()
    
    private let verticalStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = Widget.Constant.vertical
        view.layer.cornerRadius = Widget.Constant.cornerRadius
        return view
    }()
    
    init(title: String = "",
         subtitle: String = "",
         buttonTitle: String = "",
         image: Image.Name,
         closure: (()->())? = nil) {
        
        super.init(frame: .zero)
        
        self.title.text = title
        self.subtitle.text = subtitle
        
        self.image.name = image
        
        button.label.text = buttonTitle
        button.closure = closure
        
        setup()
        update()
    }
    
    private func setup() {
        [textStackView, horizontalStackView, verticalStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [title, subtitle].forEach {
            textStackView.addArrangedSubview($0)
        }
        
        [textStackView, image].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
        
        [horizontalStackView, button].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
        self.layer.cornerRadius = Widget.Constant.cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        if isHighlighted {
            self.backgroundColor = Token.Color.selectedView
            self.layer.shadowOpacity = 0
        } else {
            self.backgroundColor = Token.Color.view
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowColor = Token.Color.shadowView.cgColor
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Widget.Constant.vertical + 4),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Widget.Constant.indent),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Widget.Constant.horizontal),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Widget.Constant.indent)
        ])
    }
}


private extension Widget {
    enum Constant {
        static let vertical: CGFloat = 12
        static let horizontal: CGFloat = 16
        static let indent: CGFloat = 20
        
        static let textStack: CGFloat = 8
        static let cornerRadius: CGFloat = 24
    }
}
