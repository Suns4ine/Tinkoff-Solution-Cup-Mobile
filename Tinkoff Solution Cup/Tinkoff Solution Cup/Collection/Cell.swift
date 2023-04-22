//
//  Cell.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

import UIKit

public final class Cell: UIView {

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

    public let headerButton: Button = {
        let button = Button(text: "", closure: nil)
        return button
    }()

    public let button: Button = {
        let button = Button(text: "", closure: nil)
        button.isHidden = true
        return button
    }()

    private let horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = Cell.Constant.horizontal
        return view
    }()

    private let verticalStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = Cell.Constant.stack
        return view
    }()
    
    init(title: String = "",
        subtitle: String = "",
        image: Image.Name) {

        super.init(frame: .zero)

        self.title.text = title
        self.subtitle.text = subtitle
        
        self.image.name = image
        setup()
    }

    private func setup() {
        [title, button].forEach {
            verticalStackView.addArrangedSubview($0)
        }


        [verticalStackView, image].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        self.backgroundColor = Token.Color.backgroundCell
        self.layer.cornerRadius = Cell.Constant.cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: Cell.Constant.vertical),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Cell.Constant.horizontal),

            verticalStackView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: Cell.Constant.top),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Cell.Constant.indent),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Cell.Constant.indent),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Cell.Constant.indent)
        ])
    }
}


private extension Cell {
    enum Constant {
        static let vertical: CGFloat = 16
        static let horizontal: CGFloat = 16
        static let indent: CGFloat = 20
        static let top: CGFloat = 38

        static let stack: CGFloat = 4
        static let cornerRadius: CGFloat = 24
    }
}

