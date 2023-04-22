//
//  Cell.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

//import UIKit
//
//public final class Cell: UIView {
//
//    private var buttonClosure: (() -> (Void))?
//
//    public var isHighlighted = false {
//        didSet {
//            update()
//        }
//    }
//
//    private var items = [Item]()
//
//    public let title: LabelWidget = {
//        let label = LabelWidget(text: "", style: .title)
//        return label
//    }()
//
//    public let headerButton: Button = {
//        let button = Button(text: "", closure: nil)
//        return button
//    }()
//
//    public let button: Button = {
//        let button = Button(text: "", closure: nil)
//        button.isHidden = true
//        return button
//    }()
//
//    private let horizontalStackView: UIStackView = {
//        let view = UIStackView()
//        view.backgroundColor = .clear
//        view.distribution = .fillEqually
//        view.axis = .horizontal
//        view.spacing = Table.Constant.horizontal
//        return view
//    }()
//
//    private let verticalStackView: UIStackView = {
//        let view = UIStackView()
//        view.backgroundColor = .clear
//        view.distribution = .fillEqually
//        view.axis = .vertical
//        view.spacing = Table.Constant.vertical
//        view.layer.cornerRadius = Table.Constant.cornerRadius
//        return view
//    }()
//
//    init(title: String = "",
//         items: [Item],
//         headerClosure: (()->())? = nil,
//         closure: (()->())? = nil) {
//
//        super.init(frame: .zero)
//
//        self.title.text = title
//
//        self.items = items
//
//        self.headerClosure = headerClosure
//        buttonClosure = closure
//        setup()
//        update()
//    }
//
//    private func setup() {
//        [title, button].forEach {
//            horizontalStackView.addArrangedSubview($0)
//        }
//
//        var views: [UIView] = [horizontalStackView]
//
//        items.forEach {
//            views.append($0)
//        }
//
//        if buttonClosure != nil {
//            views.append(button)
//            button.isHidden = false
//            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
//        }
//
//        views.forEach {
//            verticalStackView.addArrangedSubview($0)
//        }
//
//        [verticalStackView].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            addSubview($0)
//        }
//
//        self.layer.cornerRadius = Table.Constant.cornerRadius
//        self.translatesAutoresizingMaskIntoConstraints = false
//
//        headerButton.addTarget(self, action: #selector(tapHeaderButton), for: .touchUpInside)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func update() {
//        if isHighlighted {
//            self.backgroundColor = Token.Color.selectedView
//            self.layer.shadowOpacity = 0
//        } else {
//            self.backgroundColor = Token.Color.view
//            self.layer.shadowOpacity = 1
//            self.layer.shadowOffset = CGSize.zero
//            self.layer.shadowColor = Token.Color.shadowView.cgColor
//        }
//
//        items.forEach {
//            $0.isHighlighted = isHighlighted
//        }
//    }
//
//    private func addConstraints() {
//        NSLayoutConstraint.activate([
//
//            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Table.Constant.vertical),
//            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Table.Constant.indent),
//            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Table.Constant.indent),
//            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Table.Constant.indent)
//        ])
//    }
//
//    @objc
//    private func tapButton() {
//        buttonClosure?()
//    }
//}
//
//
//private extension Cell {
//    enum Constant {
//        static let vertical: CGFloat = 16
//        static let horizontal: CGFloat = 16
//        static let indent: CGFloat = 20
//
//        static let textStack: CGFloat = 8
//        static let cornerRadius: CGFloat = 24
//    }
//}
//
