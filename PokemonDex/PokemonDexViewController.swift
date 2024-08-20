//
//  PokemonDexViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/9/24.
//

import UIKit

class PokemonDexViewController: UIViewController {

        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = "PokemonDex"


        NSLayoutConstraint.activate([
        ])

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

    private func requestPokemonDexData(pokemonDexNumber: Int, pokemonNumberLabel: UILabel, pokemonNameLabel: UILabel, pokemonGenusLabel: UILabel, pokemonDexDetail: UITextView, pokemonSprite: UIImageView, type1Icon: UIImageView, type1Text: UILabel, type1Background: UIView, type2Icon: UIImageView, type2Text: UILabel, type2Background: UIView) {
        pokemonNumberLabel.text = "No.\(pokemonDexNumber)"

        guard let pokemonImageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonDexNumber).png") else { return }
        let pokemonImageRequest = URLRequest(url: pokemonImageURL)

        URLSession(configuration: .default).dataTask(with: pokemonImageRequest) { imageData, imageResponse, imageError in
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
                pokemonSprite.image = image
            }
        }.resume()

        guard let pokemonUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonDexNumber)") else { return }
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
                self.configureTypeComponent(type: json.types.filter { $0.slot == 1 }[0].type.name, icon: type1Icon, typeText: type1Text, backgroundView: type1Background)

                if !json.types.filter({ $0.slot == 2 }).isEmpty {
                    self.configureTypeComponent(type: json.types.filter { $0.slot == 2 }[0].type.name, icon: type2Icon, typeText: type2Text, backgroundView: type2Background)
                } else {
                    type2Icon.image = UIImage()
                    type2Text.text = ""
                    type2Background.backgroundColor = .clear
                }
            }
        }.resume()

        guard let pokemonSpeciesUrl = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(pokemonDexNumber)") else { return }
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
                pokemonNameLabel.text = json.names.filter { $0.language.name == "ko" }.isEmpty ? json.names[0].name : json.names.filter { $0.language.name == "ko" }[0].name
                pokemonGenusLabel.text = json.genera.filter { $0.language.name == "ko" }.isEmpty ? json.genera[0].genus : json.genera.filter { $0.language.name == "ko" }[0].genus
                pokemonDexDetail.text = json.flavorTextEntries.filter { $0.language.name == "ko" }.isEmpty ? json.flavorTextEntries[0].flavorText : json.flavorTextEntries.filter { $0.language.name == "ko" }[0].flavorText
                pokemonDexDetail.setContentOffset(.zero, animated: false)
            }
        }.resume()
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
