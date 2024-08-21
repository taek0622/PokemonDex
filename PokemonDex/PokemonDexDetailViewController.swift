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
