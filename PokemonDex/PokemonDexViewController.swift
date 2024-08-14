//
//  PokemonDexViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/9/24.
//

import UIKit

// 언어
// 1: iso3166: jp, iso639: ja, name: ja-Hrkt, 일본어
// 2: iso3166: jp, iso639: ja, name: roomaji, 정식 로마자
// 3: iso3166: kr, iso639: ko, name: ko, 한국어
// 4: iso3166: cn, iso639: zh, name: zh-Hant, 중국어  / 중국어 번체 (대만)
// 5: iso3166: fr, iso639: fr, name: fr, 프랑스어
// 6: iso3166: de, iso639: de, name: de, 도이치어
// 7: iso3166: es, iso639: es, name: es, 스페인어
// 8: iso3166: it, iso639: it, name: it, 이탈리아어
// 9: iso3166: us, iso639: en, name: en, 영어
// 10: iso3166: cz, iso639: cs, name: cs, 체코어
// 11: iso3166: jp, iso639: ja, name: ja
// 12: iso3166: cn, iso639: zh, name: zh-Hans  / 중국어 간체 (중국)
// 13: iso3166: br, iso639: pt-BR, name: pt-BR

class PokemonDexViewController: UIViewController {

    private let todaysPokemonView: TodaysPokemonView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(TodaysPokemonView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = "PokemonDex"

        view.addSubview(todaysPokemonView)

        var buttonConfig = UIButton.Configuration.borderless()
        buttonConfig.background.image = #imageLiteral(resourceName: "MonsterBall")
        todaysPokemonView.titleImageButton.configuration = buttonConfig

        NSLayoutConstraint.activate([
            todaysPokemonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todaysPokemonView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            todaysPokemonView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])

        let number = Int.random(in: 1...1025)
        todaysPokemonView.pokemonNumber.text = "No.\(number)"

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
                self.configureTypeComponent(type: json.types.filter { $0.slot == 1 }[0].type.name, icon: self.todaysPokemonView.pokemonType1Icon, typeText: self.todaysPokemonView.pokemonType1Text, backgroundView: self.todaysPokemonView.pokemonType1Background)

                if !json.types.filter({ $0.slot == 2 }).isEmpty {
                    self.configureTypeComponent(type: json.types.filter { $0.slot == 2 }[0].type.name, icon: self.todaysPokemonView.pokemonType2Icon, typeText: self.todaysPokemonView.pokemonType2Text, backgroundView: self.todaysPokemonView.pokemonType2Background)
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
                        self.todaysPokemonView.pokemonSprite.image = image
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
                self.todaysPokemonView.pokemonName.text = json.names.filter { $0.language.name == "ko" }.isEmpty ? json.names[0].name : json.names.filter { $0.language.name == "ko" }[0].name
                self.todaysPokemonView.pokemonGenus.text = json.genera.filter { $0.language.name == "ko" }.isEmpty ? json.genera[0].genus : json.genera.filter { $0.language.name == "ko" }[0].genus
                self.todaysPokemonView.pokemonDexDetail.text = json.flavorTextEntries.filter { $0.language.name == "ko" }.isEmpty ? json.flavorTextEntries[0].flavorText : json.flavorTextEntries.filter { $0.language.name == "ko" }[0].flavorText
            }
        }.resume()
    }

    override func viewDidAppear(_ animated: Bool) {
        let dexBodyGradient = CAGradientLayer()
        dexBodyGradient.colors = [#colorLiteral(red: 0.3759945631, green: 0.3858169913, blue: 0.7819373012, alpha: 1).cgColor, #colorLiteral(red: 0.3937356174, green: 0.7595846653, blue: 0.8642223477, alpha: 1).cgColor]
        dexBodyGradient.locations = [0.0, 1.0]
        dexBodyGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        dexBodyGradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        dexBodyGradient.frame = todaysPokemonView.dexBodyBackground.bounds
        todaysPokemonView.dexBodyBackground.layer.insertSublayer(dexBodyGradient, at: 0)

        let viewGradient = CAGradientLayer()
        viewGradient.colors = [#colorLiteral(red: 0.3529411765, green: 0.6117647059, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2549019608, green: 0.7921568627, blue: 0.9607843137, alpha: 1).cgColor]
        viewGradient.locations = [0.0, 1.0]
        viewGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        viewGradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        viewGradient.frame = view.bounds
        view.layer.insertSublayer(viewGradient, at: 0)

        let action = UIAction { _ in
            UIView.animate(withDuration: 1) {
                self.todaysPokemonView.titleImageButton.transform = CGAffineTransform(rotationAngle: .pi)
                self.todaysPokemonView.pokemonSprite.image = #imageLiteral(resourceName: "MonsterBall")
            }

            UIView.animate(withDuration: 1) {
                self.todaysPokemonView.titleImageButton.transform = CGAffineTransform(rotationAngle: .ulpOfOne)
                let number = Int.random(in: 1...1025)
                self.todaysPokemonView.pokemonNumber.text = "No.\(number)"

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
                        self.configureTypeComponent(type: json.types.filter { $0.slot == 1 }[0].type.name, icon: self.todaysPokemonView.pokemonType1Icon, typeText: self.todaysPokemonView.pokemonType1Text, backgroundView: self.todaysPokemonView.pokemonType1Background)

                        if !json.types.filter({ $0.slot == 2 }).isEmpty {
                            self.configureTypeComponent(type: json.types.filter { $0.slot == 2 }[0].type.name, icon: self.todaysPokemonView.pokemonType2Icon, typeText: self.todaysPokemonView.pokemonType2Text, backgroundView: self.todaysPokemonView.pokemonType2Background)
                        } else {
                            self.todaysPokemonView.pokemonType2Icon.image = UIImage()
                            self.todaysPokemonView.pokemonType2Text.text = ""
                            self.todaysPokemonView.pokemonType2Background.backgroundColor = .clear
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
                                self.todaysPokemonView.pokemonSprite.image = image
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
                        self.todaysPokemonView.pokemonName.text = json.names.filter { $0.language.name == "ko" }.isEmpty ? json.names[0].name : json.names.filter { $0.language.name == "ko" }[0].name
                        self.todaysPokemonView.pokemonGenus.text = json.genera.filter { $0.language.name == "ko" }.isEmpty ? json.genera[0].genus : json.genera.filter { $0.language.name == "ko" }[0].genus
                        self.todaysPokemonView.pokemonDexDetail.text = json.flavorTextEntries.filter { $0.language.name == "ko" }.isEmpty ? json.flavorTextEntries[0].flavorText : json.flavorTextEntries.filter { $0.language.name == "ko" }[0].flavorText
                        self.todaysPokemonView.pokemonDexDetail.setContentOffset(.zero, animated: false)
                    }
                }.resume()
            }
        }

        todaysPokemonView.titleImageButton.addAction(action, for: .touchUpInside)
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
