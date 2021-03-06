//
//  CardCell.swift
//  CardMatching
//
//  Created by LEE HAEUN on 2020/07/18.
//

import UIKit

class CardCell: UICollectionViewCell {
    enum Constant {
        static let radius: CGFloat = 12
    }
    static let reuseIdentifier = String(describing: CardCell.self)

    lazy var frontView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = Constant.radius
        view.clipsToBounds = true
        return view
    }()

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    lazy var selectedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "checkmark")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .yellow
        imageView.isHidden = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(card: CardMatching) {
        if case let .image(cardImage) = card.contentType {
            imageView.image = cardImage
        } else if case let .text(cardWord) = card.contentType {
            wordLabel.text = cardWord
        }
    }

    func configureLayout() {

        contentView.addSubview(frontView)
        frontView.addSubview(imageView)
        frontView.addSubview(wordLabel)
        frontView.addSubview(selectedImage)

        NSLayoutConstraint.activate([
            frontView.topAnchor.constraint(equalTo: contentView.topAnchor),
            frontView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            frontView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            frontView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            imageView.topAnchor.constraint(equalTo: frontView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: frontView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: frontView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: frontView.bottomAnchor),

            wordLabel.topAnchor.constraint(equalTo: frontView.topAnchor),
            wordLabel.leadingAnchor.constraint(equalTo: frontView.leadingAnchor),
            wordLabel.trailingAnchor.constraint(equalTo: frontView.trailingAnchor),
            wordLabel.bottomAnchor.constraint(equalTo: frontView.bottomAnchor),

            selectedImage.topAnchor.constraint(equalTo: frontView.topAnchor),
            selectedImage.leadingAnchor.constraint(equalTo: frontView.leadingAnchor),
            selectedImage.trailingAnchor.constraint(equalTo: frontView.trailingAnchor),
            selectedImage.bottomAnchor.constraint(equalTo: frontView.bottomAnchor),

        ])
    }

}
