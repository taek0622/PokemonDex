//
//  PokemonDexDetailViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/21/24.
//

import UIKit

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
            pokemonDexDetailView.configurePokemonSpeciesData(number: selectedPokemon.id, name: name, genera: species.genera.filter { $0.language.name == "ko" }.isEmpty ? species.genera[0].genus : species.genera.filter { $0.language.name == "ko" }[0].genus)

            let baseFlavorText = species.flavorTextEntries.filter { $0.language.name == "ko" }
            pokemonDexDetailView.configurePokemonDexDetail(dexDetail: baseFlavorText.isEmpty ? "해당 언어로된 도감 설명이 없습니다." : baseFlavorText[0].flavorText)
            pokemonDexDetailView.pokemonDexTypeSelectionButton.configuration?.title = baseFlavorText.isEmpty ? "오류" : PokemonGameVersion(rawValue: baseFlavorText[0].version.name)?.configureVersionName()
            let gameVersionColor = baseFlavorText.isEmpty ? .black : PokemonGameVersion(rawValue: baseFlavorText[0].version.name)?.configureVersionColor()
            pokemonDexDetailView.pokemonDexTypeSelectionButton.configuration?.baseForegroundColor = gameVersionColor
            pokemonDexDetailView.pokemonDexTypeSelectionButton.layer.borderColor = gameVersionColor?.cgColor

            guard let sprite = selectedPokemon.sprite else { return }
            pokemonDexDetailView.configurePokemonSprite(imageData: sprite)

            guard let pokemon = selectedPokemon.pokemon else { return }
            pokemonDexDetailView.configurePokemonData(type1: pokemon.types[0].type.name, type2: pokemon.types.count == 2 ? pokemon.types[1].type.name : nil)

            pokemonDexDetailView.pokemonDexTypeSelectionButton.menu = UIMenu(title: "도감 종류", children: species.flavorTextEntries.filter { $0.language.name == "ko" }.map { flavorTextType in
                UIAction(title: PokemonGameVersion(rawValue: flavorTextType.version.name)!.configureVersionName(), handler: { _ in
                    let color = PokemonGameVersion(rawValue: flavorTextType.version.name)?.configureVersionColor()
                    self.pokemonDexDetailView.pokemonDexTypeSelectionButton.configuration?.baseForegroundColor = color
                    self.pokemonDexDetailView.pokemonDexTypeSelectionButton.layer.borderColor = color?.cgColor
                    self.pokemonDexDetailView.pokemonDexTypeSelectionButton.configuration?.title = PokemonGameVersion(rawValue: flavorTextType.version.name)?.configureVersionName()
                    self.pokemonDexDetailView.configurePokemonDexDetail(dexDetail: flavorTextType.flavorText)
                })
            })
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        view.configureGradientBackground(colors: [#colorLiteral(red: 0.3529411765, green: 0.6117647059, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2549019608, green: 0.7921568627, blue: 0.9607843137, alpha: 1).cgColor], locations: [0.0, 1.0], startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0), frame: view.bounds)
    }

    private func requestPokemonDexData(pokemonDexNumber: Int) async throws -> PokemonInfo {
        guard let pokemonImageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonDexNumber).png") else { fatalError() }
        let pokemonImageRequest = URLRequest(url: pokemonImageURL)

        let (imageData, _) = try await URLSession(configuration: .default).data(for: pokemonImageRequest)

        guard let pokemonUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonDexNumber)") else { fatalError() }
        let pokemonRequest = URLRequest(url: pokemonUrl)

        let (pokemonModelData, _) = try await URLSession(configuration: .default).data(for: pokemonRequest)
        let pokemonData = try JSONDecoder().decode(PokemonModel.self, from: pokemonModelData)

        guard let pokemonSpeciesUrl = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(pokemonDexNumber)") else { fatalError() }
        let pokemonSpeciesRequest = URLRequest(url: pokemonSpeciesUrl)

        let (pokemonSpecies, _) = try await URLSession(configuration: .default).data(for: pokemonSpeciesRequest)
        let pokemonSpeciesData = try JSONDecoder().decode(PokemonSpeciesModel.self, from: pokemonSpecies)

        return PokemonInfo(id: pokemonDexNumber, pokemon: pokemonData, species: pokemonSpeciesData, sprite: imageData)
    }

}
