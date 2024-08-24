//
//  PokemonDexDetailView.swift
//  PokemonDex
//
//  Created by 김민택 on 8/22/24.
//

import UIKit

class PokemonDexDetailView: UIView {

    // MAKR: - View

    private let pokemonDexStack: UIStackView = {
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

    private let titleImageButton = UIButton()

    private let titleText: UILabel = {
        $0.text = "#0 이름"
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

    private let pokemonName: UILabel = {
        $0.text = "포켓몬 이름"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonGenus: UILabel = {
        $0.text = "포켓몬 종류"
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

    private let pokemonDexDetail: UITextView = {
        $0.text = "도감 설명"
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

    private let pokemonDexFooter: UIView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let pokemonDexTypeSelectionButton: UIButton = {
        $0.showsMenuAsPrimaryAction = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Life Cycle

    override func layoutSubviews() {
        configureGradientBackground(colors: [#colorLiteral(red: 0.3759945631, green: 0.3858169913, blue: 0.7819373012, alpha: 1).cgColor, #colorLiteral(red: 0.3937356174, green: 0.7595846653, blue: 0.8642223477, alpha: 1).cgColor], locations: [0.0, 1.0], startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0), frame: bounds)
    }

    // MARK: - layout Method

    private func layout() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.masksToBounds = true

        addSubview(pokemonDexStack)

        pokemonDexStack.addArrangedSubview(titleStack)
        pokemonDexStack.addArrangedSubview(dexBodyBackground)
        pokemonDexStack.addArrangedSubview(pokemonDexFooter)
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

        pokemonDexFooter.addSubview(pokemonDexTypeSelectionButton)

        var buttonConfig = UIButton.Configuration.borderless()
        buttonConfig.background.image = #imageLiteral(resourceName: "MonsterBall")
        titleImageButton.configuration = buttonConfig

        NSLayoutConstraint.activate([
            pokemonDexStack.topAnchor.constraint(equalTo: topAnchor),
            pokemonDexStack.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonDexStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonDexStack.rightAnchor.constraint(equalTo: rightAnchor),
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
            pokemonDexFooter.heightAnchor.constraint(equalTo: titleStack.heightAnchor),
            pokemonDexTypeSelectionButton.topAnchor.constraint(equalTo: pokemonDexFooter.topAnchor, constant: 4),
            pokemonDexTypeSelectionButton.leftAnchor.constraint(greaterThanOrEqualTo: pokemonDexFooter.leftAnchor, constant: 16),
            pokemonDexTypeSelectionButton.bottomAnchor.constraint(equalTo: pokemonDexFooter.bottomAnchor, constant: -4),
            pokemonDexTypeSelectionButton.rightAnchor.constraint(equalTo: pokemonDexFooter.rightAnchor, constant: -16)
        ])

        pokemonDexTypeSelectionButton.layer.borderColor = UIColor.black.cgColor
        pokemonDexTypeSelectionButton.layer.borderWidth = 2
        pokemonDexTypeSelectionButton.layer.cornerRadius = 16

        var dexTypeButtonConfig = UIButton.Configuration.bordered()
        dexTypeButtonConfig.title = "버전"
        dexTypeButtonConfig.baseForegroundColor = .black
        dexTypeButtonConfig.baseBackgroundColor = .white
        pokemonDexTypeSelectionButton.configuration = dexTypeButtonConfig
        pokemonDexTypeSelectionButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
    }

    // MAKR: - Data Configure Method

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

    func configurePokemonSpeciesData(number: Int, name: String, genera: String) {
        titleText.text = "#\(number) \(name)"
        pokemonNumber.text = "No. \(number)"
        pokemonName.text = name
        pokemonGenus.text = genera
    }

    func configurePokemonDexDetail(dexDetail: String) {
        pokemonDexDetail.text = dexDetail
        pokemonDexDetail.setContentOffset(.zero, animated: false)
    }

    func configurePokemonDexButtonShape(version: PokemonGameVersion) {
        let color = version.configureVersionColor()
        pokemonDexTypeSelectionButton.configuration?.baseForegroundColor = color
        pokemonDexTypeSelectionButton.layer.borderColor = color.cgColor
        pokemonDexTypeSelectionButton.configuration?.title = version.configureVersionName()
    }

    func configurePokemonDexButtonMenu(menu: UIMenu) {
        pokemonDexTypeSelectionButton.menu = menu
    }
}
