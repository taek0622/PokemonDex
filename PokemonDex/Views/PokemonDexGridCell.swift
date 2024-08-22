//
//  PokemonDexGridCell.swift
//  PokemonDex
//
//  Created by 김민택 on 8/18/24.
//

import UIKit

class PokemonDexGridCell: UICollectionViewCell {

    static let identifier = "PokemonDexGridCell"

    private let gridStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 8
        $0.alignment = .center
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private lazy var pokemonThumbnail: UIImageView = {
        $0.image = #imageLiteral(resourceName: "MonsterBall")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private lazy var pokemonNameLabel: UILabel = {
        $0.text = "#0 이름"
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 1
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        addSubview(gridStack)
        gridStack.addArrangedSubview(pokemonThumbnail)
        gridStack.addArrangedSubview(pokemonNameLabel)

        NSLayoutConstraint.activate([
            gridStack.topAnchor.constraint(equalTo: topAnchor),
            gridStack.leftAnchor.constraint(equalTo: leftAnchor),
            gridStack.rightAnchor.constraint(equalTo: rightAnchor),
            gridStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonThumbnail.heightAnchor.constraint(equalTo: pokemonThumbnail.widthAnchor)
        ])
    }

    func configureThumbnailImage(thumbnailImage: UIImage) {
        pokemonThumbnail.image = thumbnailImage
    }

    func configureGridText(pokemonDexNumber: Int, pokemonName: String) {
        pokemonNameLabel.text = "#\(pokemonDexNumber) \(pokemonName)"
    }
}
