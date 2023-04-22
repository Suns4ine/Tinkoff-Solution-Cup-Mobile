//
//  Item.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

import UIKit

public final class Item: UIView {
    
    public private(set) var isCanDelete = false
    
    private var closure: (() -> (Void))?
    
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
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.layer.cornerRadius = Item.Constant.cornerRadius/2
        button.backgroundColor = Token.Color.buttonDelete
        button.setImage(UIImage(systemName: "Close"), for: .normal)
        return button
    }()
    
    private let textStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = Item.Constant.textStack
        return view
     }()
    
    private let horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = Item.Constant.horizontal
        return view
    }()
    
    init(title: String = "",
         subtitle: String = "",
         image: Image.Name,
         isCanDelete: Bool = false,
         deleteClosure: (()->())? = nil) {
        
        super.init(frame: .zero)
        
        self.title.text = title
        self.subtitle.text = subtitle
        
        self.image.name = image

        closure = deleteClosure
        setup()
        update()
    }
    
    private func setup() {
        [textStackView, horizontalStackView, deleteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [title, subtitle].forEach {
            textStackView.addArrangedSubview($0)
        }
        
        [image, textStackView].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
        
        self.layer.cornerRadius = Item.Constant.cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if isCanDelete {
            deleteButton.isHidden = false
            deleteButton.addTarget(self, action: #selector(tapDeleteButton), for: .touchUpInside)
        }
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
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Item.Constant.vertical),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Item.Constant.indent),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Item.Constant.horizontal),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Item.Constant.indent)
        ])
        
        if isCanDelete {
            NSLayoutConstraint.activate([
                deleteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: Item.Constant.vertical),
                deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Item.Constant.horizontal)
            ])
        }
    }
    
    @objc
    private func tapDeleteButton() {
        closure?()
    }
}


private extension Item {
    enum Constant {
        static let vertical: CGFloat = 16
        static let horizontal: CGFloat = 16
        static let indent: CGFloat = 20
        
        static let textStack: CGFloat = 8
        static let cornerRadius: CGFloat = 24
    }
}
