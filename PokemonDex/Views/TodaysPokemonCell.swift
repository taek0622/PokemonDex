//
//  TodaysPokemonCell.swift
//  PokemonDex
//
//  Created by 김민택 on 8/15/24.
//

import UIKit

class TodaysPokemonCell: UICollectionViewCell {

    static let identifier = "TodaysPokemonCell"

    private let todaysPokemonStack: UIStackView = {
        $0.spacing = 0
        $0.axis = .vertical
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let titleStack: UIStackView = {
        $0.spacing = 8
        $0.axis = .horizontal
        $0.backgroundColor = .white
        $0.alignment = .leading
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let dexBodyBackground: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let dexBodyStack: UIStackView = {
        $0.spacing = 4
        $0.axis = .horizontal
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    let titleImageButton = UIButton()

    private let titleText: UILabel = {
        $0.text = "오늘의 포켓몬"
        $0.font = .boldSystemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let dexBodyDetailStack: UIStackView = {
        $0.spacing = 4
        $0.axis = .vertical
        $0.alignment = .top
        $0.distribution = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let pokemonNumber: UILabel = {
        $0.text = "No."
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

        $0.text = ""
    private let pokemonName: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

        $0.text = "포켓몬"
    private let pokemonGenus: UILabel = {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonTypeStack: UIStackView = {
        $0.spacing = 4
        $0.axis = .horizontal
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let emptyView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let pokemonType1Background: UIView = {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let pokemonType1Stack: UIStackView = {
        $0.spacing = 4
        $0.axis = .horizontal
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let pokemonType1Icon: UIImageView = {
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private let pokemonType1Text: UILabel = {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonType2Background: UIView = {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let pokemonType2Stack: UIStackView = {
        $0.spacing = 4
        $0.axis = .horizontal
        $0.isLayoutMarginsRelativeArrangement = true
        $0.layoutMargins = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let pokemonType2Icon: UIImageView = {
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private let pokemonType2Text: UILabel = {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

        $0.text = "설명"
    private let pokemonDexDetail: UITextView = {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.isEditable = false
        $0.isScrollEnabled = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextView())

    private let pokemonSprite: UIImageView = {
        $0.image = #imageLiteral(resourceName: "MonsterBall")
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private let todaysPokemonFooter: UIView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        let dexBodyGradient = CAGradientLayer()
        dexBodyGradient.colors = [#colorLiteral(red: 0.3759945631, green: 0.3858169913, blue: 0.7819373012, alpha: 1).cgColor, #colorLiteral(red: 0.3937356174, green: 0.7595846653, blue: 0.8642223477, alpha: 1).cgColor]
        dexBodyGradient.locations = [0.0, 1.0]
        dexBodyGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        dexBodyGradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        dexBodyGradient.frame = bounds
        layer.insertSublayer(dexBodyGradient, at: 0)
    }

    private func layout() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.masksToBounds = true

        addSubview(todaysPokemonStack)

        todaysPokemonStack.addArrangedSubview(titleStack)
        todaysPokemonStack.addArrangedSubview(dexBodyBackground)
        todaysPokemonStack.addArrangedSubview(todaysPokemonFooter)
        dexBodyBackground.addSubview(dexBodyStack)

        titleStack.addArrangedSubview(titleImageButton)
        titleStack.addArrangedSubview(titleText)

        dexBodyStack.addArrangedSubview(dexBodyDetailStack)
        dexBodyStack.addArrangedSubview(pokemonSprite)

        dexBodyDetailStack.addArrangedSubview(pokemonNumber)
        dexBodyDetailStack.addArrangedSubview(pokemonName)
        dexBodyDetailStack.addArrangedSubview(pokemonGenus)
        dexBodyDetailStack.addArrangedSubview(pokemonTypeStack)
        dexBodyDetailStack.addArrangedSubview(pokemonDexDetail)
        dexBodyDetailStack.addArrangedSubview(emptyView)

        pokemonTypeStack.addArrangedSubview(pokemonType1Background)
        pokemonTypeStack.addArrangedSubview(pokemonType2Background)
        pokemonTypeStack.addArrangedSubview(emptyView)

        pokemonType1Background.addSubview(pokemonType1Stack)
        pokemonType2Background.addSubview(pokemonType2Stack)

        pokemonType1Stack.addArrangedSubview(pokemonType1Icon)
        pokemonType1Stack.addArrangedSubview(pokemonType1Text)

        pokemonType2Stack.addArrangedSubview(pokemonType2Icon)
        pokemonType2Stack.addArrangedSubview(pokemonType2Text)

        var buttonConfig = UIButton.Configuration.borderless()
        buttonConfig.background.image = #imageLiteral(resourceName: "MonsterBall")
        titleImageButton.configuration = buttonConfig

        NSLayoutConstraint.activate([
            todaysPokemonStack.topAnchor.constraint(equalTo: topAnchor),
            todaysPokemonStack.leftAnchor.constraint(equalTo: leftAnchor),
            todaysPokemonStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            todaysPokemonStack.rightAnchor.constraint(equalTo: rightAnchor),
            dexBodyStack.topAnchor.constraint(equalTo: dexBodyBackground.topAnchor),
            dexBodyStack.leftAnchor.constraint(equalTo: dexBodyBackground.leftAnchor),
            dexBodyStack.bottomAnchor.constraint(equalTo: dexBodyBackground.bottomAnchor),
            dexBodyStack.rightAnchor.constraint(equalTo: dexBodyBackground.rightAnchor),
            titleImageButton.widthAnchor.constraint(equalToConstant: 21),
            titleImageButton.heightAnchor.constraint(equalToConstant: 21),
            pokemonType1Stack.topAnchor.constraint(equalTo: pokemonType1Background.topAnchor),
            pokemonType1Stack.leftAnchor.constraint(equalTo: pokemonType1Background.leftAnchor),
            pokemonType1Stack.bottomAnchor.constraint(equalTo: pokemonType1Background.bottomAnchor),
            pokemonType1Stack.rightAnchor.constraint(equalTo: pokemonType1Background.rightAnchor),
            pokemonType2Stack.topAnchor.constraint(equalTo: pokemonType2Background.topAnchor),
            pokemonType2Stack.leftAnchor.constraint(equalTo: pokemonType2Background.leftAnchor),
            pokemonType2Stack.bottomAnchor.constraint(equalTo: pokemonType2Background.bottomAnchor),
            pokemonType2Stack.rightAnchor.constraint(equalTo: pokemonType2Background.rightAnchor),
            pokemonType1Icon.widthAnchor.constraint(equalToConstant: 17),
            pokemonType1Icon.heightAnchor.constraint(equalToConstant: 17),
            pokemonType2Icon.widthAnchor.constraint(equalToConstant: 17),
            pokemonType2Icon.heightAnchor.constraint(equalToConstant: 17),
            pokemonDexDetail.widthAnchor.constraint(equalTo: dexBodyDetailStack.widthAnchor),
            pokemonSprite.heightAnchor.constraint(equalTo: pokemonSprite.widthAnchor),
            todaysPokemonFooter.heightAnchor.constraint(equalTo: titleStack.heightAnchor)
        ])
    }

    // MARK: - Data Configure Method

    func configurePokemonSprite(imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        pokemonSprite.image = image
    }

    func configurePokemonData(type1: String, type2: String?) {
        let pokemonType1 = PokemonType(rawValue: type1)
        pokemonType1Icon.image = pokemonType1?.configureTypeIcon()
        pokemonType1Text.text = pokemonType1?.configureTypeText()
        pokemonType1Background.backgroundColor = pokemonType1?.configureTypeColor()

        if type2 != nil {
            let pokemonType2 = PokemonType(rawValue: type2!)
            pokemonType2Icon.image = pokemonType2?.configureTypeIcon()
            pokemonType2Text.text = pokemonType2?.configureTypeText()
            pokemonType2Background.backgroundColor = pokemonType2?.configureTypeColor()
        } else {
            pokemonType2Icon.image = UIImage()
            pokemonType2Text.text = ""
            pokemonType2Background.backgroundColor = .clear
        }
    }

    func configurePokemonSpeciesData(number: Int, name: String, genera: String, dexDetail: String) {
        pokemonNumber.text = "No. \(number)"
        pokemonName.text = name
        pokemonGenus.text = genera
        pokemonDexDetail.text = dexDetail
        pokemonDexDetail.setContentOffset(.zero, animated: false)
    }

}
