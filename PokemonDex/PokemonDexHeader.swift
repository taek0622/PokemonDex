//
//  PokemonDexHeader.swift
//  PokemonDex
//
//  Created by 김민택 on 8/19/24.
//

import UIKit

class PokemonDexHeader: UICollectionReusableView {

    static let identifier = "PokemonDexHeader"

    private let headerStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let headerIcon: UIImageView = {
        $0.image = #imageLiteral(resourceName: "MonsterBall")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private let headerText: UILabel = {
        $0.text = "목록"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func layout() {
        addSubview(headerStack)
        headerStack.addArrangedSubview(headerIcon)
        headerStack.addArrangedSubview(headerText)

        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: topAnchor),
            headerStack.leftAnchor.constraint(equalTo: leftAnchor),
            headerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStack.rightAnchor.constraint(equalTo: rightAnchor),
            headerIcon.widthAnchor.constraint(equalToConstant: 21),
            headerIcon.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}
