//
//  TodaysPokemonViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/9/24.
//

import UIKit

class TodaysPokemonViewController: UIViewController {

    private let todaysPokemonBackground: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 16
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private let todaysPokemonStack: UIStackView = {
        $0.spacing = 0
        $0.axis = .vertical
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let titleStack: UIStackView = {
        $0.spacing = 8
        $0.axis = .horizontal
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

    private let todaysPokemonFooter: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = "PokemonDex"

        view.addSubview(todaysPokemonBackground)
        todaysPokemonBackground.addSubview(todaysPokemonStack)

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
            todaysPokemonBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todaysPokemonBackground.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            todaysPokemonBackground.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            todaysPokemonStack.topAnchor.constraint(equalTo: todaysPokemonBackground.topAnchor),
            todaysPokemonStack.leftAnchor.constraint(equalTo: todaysPokemonBackground.leftAnchor),
            todaysPokemonStack.bottomAnchor.constraint(equalTo: todaysPokemonBackground.bottomAnchor),
            todaysPokemonStack.rightAnchor.constraint(equalTo: todaysPokemonBackground.rightAnchor),
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

        let number = Int.random(in: 1...1025)
        pokemonNumber.text = "No.\(number)"

        guard let pokemonUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(number)") else { return }
        let pokemonRequest = URLRequest(url: pokemonUrl)

        URLSession(configuration: .default).dataTask(with: pokemonRequest) { data, response, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data else {
                print("Error: Request fail")
                return
            }

            guard let json = try? JSONDecoder().decode(PokemonModel.self, from: data) else {
                print("Error: Data Decoding error")
                return
            }

            DispatchQueue.main.async {
                self.configureTypeComponent(type: json.types.filter { $0.slot == 1 }[0].type.name, icon: self.pokemonType1Icon, typeText: self.pokemonType1Text, backgroundView: self.pokemonType1Background)

                if !json.types.filter { $0.slot == 2 }.isEmpty {
                    self.configureTypeComponent(type: json.types.filter { $0.slot == 2 }[0].type.name, icon: self.pokemonType2Icon, typeText: self.pokemonType2Text, backgroundView: self.pokemonType2Background)
                }

                guard let imageURLString = json.sprites.other.officialArtwork.frontDefault else { return }
                guard let imageURL = URL(string: imageURLString) else { return }
                let imageRequest = URLRequest(url: imageURL)

                URLSession(configuration: .default).dataTask(with: imageRequest) { imageData, imageResponse, imageError in
                    if let imageError {
                        print("Image Error: \(imageError.localizedDescription)")
                        return
                    }

                    guard let imageData else {
                        print("Image Error: Data Error")
                        return
                    }

                    guard let image = UIImage(data: imageData) else {
                        print("Image Data Error")
                        return
                    }

                    DispatchQueue.main.async {
                        self.pokemonSprite.image = image
                    }
                }.resume()
            }
        }.resume()

        guard let pokemonSpeciesUrl = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(number)") else { return }
        let pokemonSpeciesRequest = URLRequest(url: pokemonSpeciesUrl)

        URLSession(configuration: .default).dataTask(with: pokemonSpeciesRequest) { data, response, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data else {
                print("Error: Request fail")
                return
            }

            guard let json = try? JSONDecoder().decode(PokemonSpeciesModel.self, from: data) else {
                print("Error: Data Decoding error")
                return
            }

            DispatchQueue.main.async {
                self.pokemonName.text = json.names.filter { $0.language.name == "ko" }.isEmpty ? json.names[0].name : json.names.filter { $0.language.name == "ko" }[0].name
                self.pokemonGenus.text = json.genera.filter { $0.language.name == "ko" }.isEmpty ? json.genera[0].genus : json.genera.filter { $0.language.name == "ko" }[0].genus
                self.pokemonDexDetail.text = json.flavorTextEntries.filter { $0.language.name == "ko" }.isEmpty ? json.flavorTextEntries[0].flavorText : json.flavorTextEntries.filter { $0.language.name == "ko" }[0].flavorText
            }
        }.resume()
    }

    override func viewDidAppear(_ animated: Bool) {
        let dexBodyGradient = CAGradientLayer()
        dexBodyGradient.colors = [#colorLiteral(red: 0.3759945631, green: 0.3858169913, blue: 0.7819373012, alpha: 1).cgColor, #colorLiteral(red: 0.3937356174, green: 0.7595846653, blue: 0.8642223477, alpha: 1).cgColor]
        dexBodyGradient.locations = [0.0, 1.0]
        dexBodyGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        dexBodyGradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        dexBodyGradient.frame = dexBodyBackground.bounds
        dexBodyBackground.layer.insertSublayer(dexBodyGradient, at: 0)

        let viewGradient = CAGradientLayer()
        viewGradient.colors = [#colorLiteral(red: 0.3529411765, green: 0.6117647059, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2549019608, green: 0.7921568627, blue: 0.9607843137, alpha: 1).cgColor]
        viewGradient.locations = [0.0, 1.0]
        viewGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        viewGradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        viewGradient.frame = view.bounds
        view.layer.insertSublayer(viewGradient, at: 0)

        let action = UIAction { _ in
            UIView.animate(withDuration: 1) {
                self.titleImageButton.transform = CGAffineTransform(rotationAngle: .pi)
                self.pokemonSprite.image = #imageLiteral(resourceName: "MonsterBall")
            }

            UIView.animate(withDuration: 1) {
                self.titleImageButton.transform = CGAffineTransform(rotationAngle: .ulpOfOne)
                let number = Int.random(in: 1...1025)
                self.pokemonNumber.text = "No.\(number)"

                guard let pokemonUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(number)") else { return }
                let pokemonRequest = URLRequest(url: pokemonUrl)

                URLSession(configuration: .default).dataTask(with: pokemonRequest) { data, response, error in
                    if let error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }

                    guard let data else {
                        print("Error: Request fail")
                        return
                    }

                    guard let json = try? JSONDecoder().decode(PokemonModel.self, from: data) else {
                        print("Error: Data Decoding error")
                        return
                    }

                    DispatchQueue.main.async {
                        self.configureTypeComponent(type: json.types.filter { $0.slot == 1 }[0].type.name, icon: self.pokemonType1Icon, typeText: self.pokemonType1Text, backgroundView: self.pokemonType1Background)

                        if !json.types.filter { $0.slot == 2 }.isEmpty {
                            self.configureTypeComponent(type: json.types.filter { $0.slot == 2 }[0].type.name, icon: self.pokemonType2Icon, typeText: self.pokemonType2Text, backgroundView: self.pokemonType2Background)
                        }

                        guard let imageURLString = json.sprites.other.officialArtwork.frontDefault else { return }
                        guard let imageURL = URL(string: imageURLString) else { return }
                        let imageRequest = URLRequest(url: imageURL)

                        URLSession(configuration: .default).dataTask(with: imageRequest) { imageData, imageResponse, imageError in
                            if let imageError {
                                print("Image Error: \(imageError.localizedDescription)")
                                return
                            }

                            guard let imageData else {
                                print("Image Error: Data Error")
                                return
                            }

                            guard let image = UIImage(data: imageData) else {
                                print("Image Data Error")
                                return
                            }

                            DispatchQueue.main.async {
                                self.pokemonSprite.image = image
                            }
                        }.resume()
                    }
                }.resume()

                guard let pokemonSpeciesUrl = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(number)") else { return }
                let pokemonSpeciesRequest = URLRequest(url: pokemonSpeciesUrl)

                URLSession(configuration: .default).dataTask(with: pokemonSpeciesRequest) { data, response, error in
                    if let error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }

                    guard let data else {
                        print("Error: Request fail")
                        return
                    }

                    guard let json = try? JSONDecoder().decode(PokemonSpeciesModel.self, from: data) else {
                        print("Error: Data Decoding error")
                        return
                    }

                    DispatchQueue.main.async {
                        self.pokemonName.text = json.names.filter { $0.language.name == "ko" }.isEmpty ? json.names[0].name : json.names.filter { $0.language.name == "ko" }[0].name
                        self.pokemonGenus.text = json.genera.filter { $0.language.name == "ko" }.isEmpty ? json.genera[0].genus : json.genera.filter { $0.language.name == "ko" }[0].genus
                        self.pokemonDexDetail.text = json.flavorTextEntries.filter { $0.language.name == "ko" }.isEmpty ? json.flavorTextEntries[0].flavorText : json.flavorTextEntries.filter { $0.language.name == "ko" }[0].flavorText
                    }
                }.resume()
            }
        }

        titleImageButton.addAction(action, for: .touchUpInside)
    }

    private func configureTypeComponent(type typeName: String, icon: UIImageView, typeText: UILabel, backgroundView: UIView) {
        switch typeName {
        case "normal":
            icon.image = #imageLiteral(resourceName: "Normal")
            typeText.text = "노말"
            backgroundView.backgroundColor = TypeColor.normal
        case "fire":
            icon.image = #imageLiteral(resourceName: "Fire")
            typeText.text = "불꽃"
            backgroundView.backgroundColor = TypeColor.fire
        case "water":
            icon.image = #imageLiteral(resourceName: "Water")
            typeText.text = "물"
            backgroundView.backgroundColor = TypeColor.water
        case "grass":
            icon.image = #imageLiteral(resourceName: "Grass")
            typeText.text = "풀"
            backgroundView.backgroundColor = TypeColor.grass
        case "electric":
            icon.image = #imageLiteral(resourceName: "Electric")
            typeText.text = "전기"
            backgroundView.backgroundColor = TypeColor.electric
        case "ice":
            icon.image = #imageLiteral(resourceName: "Ice")
            typeText.text = "얼음"
            backgroundView.backgroundColor = TypeColor.ice
        case "fighting":
            icon.image = #imageLiteral(resourceName: "Fighting")
            typeText.text = "격투"
            backgroundView.backgroundColor = TypeColor.fighting
        case "poison":
            icon.image = #imageLiteral(resourceName: "Poison")
            typeText.text = "독"
            backgroundView.backgroundColor = TypeColor.poison
        case "ground":
            icon.image = #imageLiteral(resourceName: "Ground")
            typeText.text = "땅"
            backgroundView.backgroundColor = TypeColor.ground
        case "flying":
            icon.image = #imageLiteral(resourceName: "Flying")
            typeText.text = "비행"
            backgroundView.backgroundColor = TypeColor.flying
        case "psychic":
            icon.image = #imageLiteral(resourceName: "Psychic")
            typeText.text = "에스퍼"
            backgroundView.backgroundColor = TypeColor.psychic
        case "bug":
            icon.image = #imageLiteral(resourceName: "Bug")
            typeText.text = "벌레"
            backgroundView.backgroundColor = TypeColor.bug
        case "rock":
            icon.image = #imageLiteral(resourceName: "Rock")
            typeText.text = "바위"
            backgroundView.backgroundColor = TypeColor.rock
        case "ghost":
            icon.image = #imageLiteral(resourceName: "Ghost")
            typeText.text = "고스트"
            backgroundView.backgroundColor = TypeColor.ghost
        case "dragon":
            icon.image = #imageLiteral(resourceName: "Dragon")
            typeText.text = "드래곤"
            backgroundView.backgroundColor = TypeColor.dragon
        case "dark":
            icon.image = #imageLiteral(resourceName: "Dark")
            typeText.text = "악"
            backgroundView.backgroundColor = TypeColor.dark
        case "steel":
            icon.image = #imageLiteral(resourceName: "Steel")
            typeText.text = "강철"
            backgroundView.backgroundColor = TypeColor.steel
        case "fairy":
            icon.image = #imageLiteral(resourceName: "Fairy")
            typeText.text = "페어리"
            backgroundView.backgroundColor = TypeColor.fairy
        default:
            break
        }
    }

}
