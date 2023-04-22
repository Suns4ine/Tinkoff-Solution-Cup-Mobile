//
//  Image.swift
//  Tinkoff Solution Cup
//
//  Created by Vyacheslav Pronin on 22.04.2023.
//

import UIKit


public class Image: UIView {
    
    var name: Image.Name = .`default` {
        didSet {
            setupImage()
        }
    }
    
    private var image: UIImage? = {
        let image = UIImage()
        
        return image
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    init(name: Image.Name,
         image: UIImage? = nil,
         background: UIColor? = Token.Color.backgroundImage) {
        super.init(frame: .zero)
        
        self.name = name
        self.image = image
        self.backgroundColor = background
        
        setup()
    }
    
    private func setup() {
        [imageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = Image.Constant.height/2
        
        setupImage()
        addConstraints()
        
    }
    
    private func setupImage() {
        switch name {
        case .default:
            image = UIImage(systemName: "lasso")
        case .star:
            image = UIImage(systemName: "star")
        case .logo:
            image = UIImage(systemName: "logo")
        case .another:
            break
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Image.Constant.height),
            self.widthAnchor.constraint(equalToConstant: Image.Constant.width),
            
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Image.Constant.indent),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Image.Constant.indent),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Image.Constant.indent),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Image.Constant.indent)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension Image {
    enum Name {
        case `default`
        case star
        case logo
        case another
    }
}

private extension Image {
    enum Constant {
        static let height: CGFloat = 40
        static let width: CGFloat = 40
        
        static let indent: CGFloat = 8
    }
}
