//
//  PokemonDexDetailViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/21/24.
//

import UIKit

class PokemonDexDetailView: UIView {

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
        $0.text = ""
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonGenus: UILabel = {
        $0.text = "포켓몬"
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
        $0.text = "설명"
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
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())

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

        pokemonDexTypeSelectionButton.layer.borderColor = UIColor.red.cgColor
        pokemonDexTypeSelectionButton.layer.borderWidth = 2
        pokemonDexTypeSelectionButton.layer.cornerRadius = 16

        var dexTypeButtonConfig = UIButton.Configuration.bordered()
        dexTypeButtonConfig.title = "스칼렛"
        dexTypeButtonConfig.baseForegroundColor = .red
        dexTypeButtonConfig.baseBackgroundColor = .white
        pokemonDexTypeSelectionButton.configuration = dexTypeButtonConfig
        pokemonDexTypeSelectionButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
    }

    func configurePokemonSprite(imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        pokemonSprite.image = image
    }

    func configurePokemonData(type1: String, type2: String?) {
        let configType1 = configurePokemonType(typeName: type1)
        pokemonType1Icon.image = configType1.icon
        pokemonType1Text.text = configType1.typeText
        pokemonType1Background.backgroundColor = configType1.backgroundColor

        if type2 != nil {
            let configType2 = configurePokemonType(typeName: type2!)
            pokemonType2Icon.image = configType2.icon
            pokemonType2Text.text = configType2.typeText
            pokemonType2Background.backgroundColor = configType2.backgroundColor
        } else {
            pokemonType2Icon.image = UIImage()
            pokemonType2Text.text = ""
            pokemonType2Background.backgroundColor = .clear
        }
    }

    func configurePokemonSpeciesData(number: Int, name: String, genera: String, dexDetail: String) {
        titleText.text = "#\(number) \(name)"
        pokemonNumber.text = "No. \(number)"
        pokemonName.text = name
        pokemonGenus.text = genera
        pokemonDexDetail.text = dexDetail
        pokemonDexDetail.setContentOffset(.zero, animated: false)
    }

    func configurePokemonType(typeName: String) -> (icon: UIImage, typeText: String, backgroundColor: UIColor) {
        switch typeName {
            case "normal":
                return (#imageLiteral(resourceName: "Normal"), "노말", TypeColor.normal)
            case "fire":
                return (#imageLiteral(resourceName: "Fire"), "불꽃", TypeColor.fire)
            case "water":
                return(#imageLiteral(resourceName: "Water"), "물", TypeColor.water)
            case "grass":
                return (#imageLiteral(resourceName: "Grass"), "풀", TypeColor.grass)
            case "electric":
                return (#imageLiteral(resourceName: "Electric"), "전기", TypeColor.electric)
            case "ice":
                return (#imageLiteral(resourceName: "Ice"), "얼음", TypeColor.ice)
            case "fighting":
                return (#imageLiteral(resourceName: "Fighting"), "격투", TypeColor.fighting)
            case "poison":
                return (#imageLiteral(resourceName: "Poison"), "독", TypeColor.poison)
            case "ground":
                return (#imageLiteral(resourceName: "Ground"), "땅", TypeColor.ground)
            case "flying":
                return (#imageLiteral(resourceName: "Flying"), "비행", TypeColor.flying)
            case "psychic":
                return (#imageLiteral(resourceName: "Psychic"), "에스퍼", TypeColor.psychic)
            case "bug":
                return (#imageLiteral(resourceName: "Bug"), "벌레", TypeColor.bug)
            case "rock":
                return (#imageLiteral(resourceName: "Rock"), "바위", TypeColor.rock)
            case "ghost":
                return (#imageLiteral(resourceName: "Ghost"), "고스트", TypeColor.ghost)
            case "dragon":
                return (#imageLiteral(resourceName: "Dragon"), "드래곤", TypeColor.dragon)
            case "dark":
                return (#imageLiteral(resourceName: "Dark"), "악", TypeColor.dark)
            case "steel":
                return (#imageLiteral(resourceName: "Steel"), "강철", TypeColor.steel)
            case "fairy":
                return (#imageLiteral(resourceName: "Fairy"), "페어리", TypeColor.fairy)
            default:
                return (#imageLiteral(resourceName: "Normal"), "노말", TypeColor.normal)
        }
    }
}

class PokemonDexDetailViewController: UIViewController {

    var selectedPokemon: PokemonInfo?

    private let pokemonDexDetailView: PokemonDexDetailView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(PokemonDexDetailView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3042269349, green: 0.6989482641, blue: 0.9806881547, alpha: 1)

        view.addSubview(pokemonDexDetailView)
        NSLayoutConstraint.activate([
            pokemonDexDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokemonDexDetailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            pokemonDexDetailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])

        Task {
            selectedPokemon = try await requestPokemonDexData(pokemonDexNumber: selectedPokemon!.id)

            guard let selectedPokemon else { return }
            guard let species = selectedPokemon.species else { return }
            let name = species.names.filter { $0.language.name == "ko" }.isEmpty ? species.name : species.names.filter { $0.language.name == "ko" }[0].name
            navigationItem.title = name
            pokemonDexDetailView.configurePokemonSpeciesData(number: selectedPokemon.id, name: name, genera: species.genera.filter { $0.language.name == "ko" }.isEmpty ? species.genera[0].genus : species.genera.filter { $0.language.name == "ko" }[0].genus, dexDetail: species.flavorTextEntries.filter { $0.language.name == "ko" }.isEmpty ? species.flavorTextEntries[0].flavorText : species.flavorTextEntries.filter { $0.language.name == "ko" }[0].flavorText)

            guard let sprite = selectedPokemon.sprite else { return }
            pokemonDexDetailView.configurePokemonSprite(imageData: sprite)

            guard let pokemon = selectedPokemon.pokemon else { return }
            pokemonDexDetailView.configurePokemonData(type1: pokemon.types[0].type.name, type2: pokemon.types.count == 2 ? pokemon.types[1].type.name : nil)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        let viewGradient = CAGradientLayer()
        viewGradient.colors = [#colorLiteral(red: 0.3529411765, green: 0.6117647059, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2549019608, green: 0.7921568627, blue: 0.9607843137, alpha: 1).cgColor]
        viewGradient.locations = [0.0, 1.0]
        viewGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        viewGradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        viewGradient.frame = view.bounds
        view.layer.insertSublayer(viewGradient, at: 0)
    }

    private func requestPokemonDexData(pokemonDexNumber: Int) async throws -> PokemonInfo {
        var newPokemon = PokemonInfo(id: pokemonDexNumber)

        guard let pokemonImageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonDexNumber).png") else { fatalError() }
        let pokemonImageRequest = URLRequest(url: pokemonImageURL)

        let (imageData, _) = try await URLSession(configuration: .default).data(for: pokemonImageRequest)
        newPokemon.sprite = imageData

        guard let pokemonUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonDexNumber)") else { fatalError() }
        let pokemonRequest = URLRequest(url: pokemonUrl)

        let (pokemonModelData, _) = try await URLSession(configuration: .default).data(for: pokemonRequest)
        let pokemonData = try JSONDecoder().decode(PokemonModel.self, from: pokemonModelData)
        newPokemon.pokemon = pokemonData

        guard let pokemonSpeciesUrl = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(pokemonDexNumber)") else { fatalError() }
        let pokemonSpeciesRequest = URLRequest(url: pokemonSpeciesUrl)

        let (pokemonSpecies, _) = try await URLSession(configuration: .default).data(for: pokemonSpeciesRequest)
        let pokemonSpeciesData = try JSONDecoder().decode(PokemonSpeciesModel.self, from: pokemonSpecies)
        newPokemon.species = pokemonSpeciesData

        return newPokemon
    }

}
