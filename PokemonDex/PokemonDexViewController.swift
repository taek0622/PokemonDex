//
//  PokemonDexViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/9/24.
//

import UIKit

class PokemonDexViewController: UIViewController {

    enum Section: Int, CaseIterable {
        case todaysPokemon
        case pokemonDexGrid
    }

    private var todaysPokemon = PokemonInfo(id: 0)
    private var pokemonDexGridDataSource: UICollectionViewDiffableDataSource<Section, Int>!

    private lazy var pokemonDexListCollectionView: UICollectionView = {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { section, env in
        self.configureSection(for: section)
    })))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = "PokemonDex"

        view.addSubview(pokemonDexListCollectionView)

        NSLayoutConstraint.activate([
            pokemonDexListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pokemonDexListCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            pokemonDexListCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            pokemonDexListCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        Task {
            todaysPokemon = try await requestPokemonDexAsyncData(pokemonDexNumber: Int.random(in: 1...1025))
            configureDataSource()
            applyPokemonDexGridSnapshot()
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

    private func requestPokemonDexAsyncData(pokemonDexNumber: Int) async throws -> PokemonInfo {
        guard let pokemonImageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonDexNumber).png") else { fatalError() }
        let pokemonImageRequest = URLRequest(url: pokemonImageURL)

        let (pokemonImageData, _) = try await URLSession(configuration: .default).data(for: pokemonImageRequest)

        guard let pokemonUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonDexNumber)") else { fatalError() }
        let pokemonRequest = URLRequest(url: pokemonUrl)

        let (pokemonData, _) = try await URLSession(configuration: .default).data(for: pokemonRequest)
        let pokemonModel = try JSONDecoder().decode(PokemonModel.self, from: pokemonData)

        guard let pokemonSpeciesUrl = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(pokemonDexNumber)") else { fatalError() }
        let pokemonSpeciesRequest = URLRequest(url: pokemonSpeciesUrl)

        let (pokemonSpeciesData, _) = try await URLSession(configuration: .default).data(for: pokemonSpeciesRequest)
        let pokemonSpeciesModel = try JSONDecoder().decode(PokemonSpeciesModel.self, from: pokemonSpeciesData)

        return PokemonInfo(id: pokemonDexNumber, pokemon: pokemonModel, species: pokemonSpeciesModel, sprite: pokemonImageData)
    }

    private func requestPokemonDexData(pokemonNumberLabel: UILabel, pokemonNameLabel: UILabel, pokemonGenusLabel: UILabel, pokemonDexDetail: UITextView, pokemonSprite: UIImageView, type1Icon: UIImageView, type1Text: UILabel, type1Background: UIView, type2Icon: UIImageView, type2Text: UILabel, type2Background: UIView) {
        pokemonNumberLabel.text = "No.\(todaysPokemon.id)"
        guard let imageData = todaysPokemon.sprite, let image = UIImage(data: imageData) else { return }
        pokemonSprite.image = image

        guard let pokemonData = todaysPokemon.pokemon else { return }
        configureTypeComponent(type: pokemonData.types.filter { $0.slot == 1 }[0].type.name, icon: type1Icon, typeText: type1Text, backgroundView: type1Background)

        if !pokemonData.types.filter({ $0.slot == 2 }).isEmpty {
            configureTypeComponent(type: pokemonData.types.filter { $0.slot == 2 }[0].type.name, icon: type2Icon, typeText: type2Text, backgroundView: type2Background)
        } else {
            type2Icon.image = UIImage()
            type2Text.text = ""
            type2Background.backgroundColor = .clear
        }

        guard let pokemonSpecies = todaysPokemon.species else { return }

        pokemonNameLabel.text = pokemonSpecies.names.filter { $0.language.name == "ko" }.isEmpty ? pokemonSpecies.names[0].name : pokemonSpecies.names.filter { $0.language.name == "ko" }[0].name
        pokemonGenusLabel.text = pokemonSpecies.genera.filter { $0.language.name == "ko" }.isEmpty ? pokemonSpecies.genera[0].genus : pokemonSpecies.genera.filter { $0.language.name == "ko" }[0].genus
        pokemonDexDetail.text = pokemonSpecies.flavorTextEntries.filter { $0.language.name == "ko" }.isEmpty ? pokemonSpecies.flavorTextEntries[0].flavorText : pokemonSpecies.flavorTextEntries.filter { $0.language.name == "ko" }[0].flavorText
        pokemonDexDetail.setContentOffset(.zero, animated: false)
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

    private func configureSection(for section: Int) -> NSCollectionLayoutSection {
        switch section {
            case 0:
                return configureTodaysPokemonSection()
            case 1:
                return configurePokemonDexGridSection()
            default:
                return configureTodaysPokemonSection()
        }
    }

    private func configureTodaysPokemonSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(3/4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)

        return section
    }

    private func configurePokemonDexGridSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(UIScreen.main.bounds.width / 3 + 8))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: PokemonDexHeader.identifier, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    private func configureDataSource() {
        let todaysPokemonCellRegistration = UICollectionView.CellRegistration<TodaysPokemonCell, Int> { (cell, indexPath, item) in
            var buttonConfig = UIButton.Configuration.borderless()
            buttonConfig.background.image = #imageLiteral(resourceName: "MonsterBall")
            cell.titleImageButton.configuration = buttonConfig

            self.requestPokemonDexData(pokemonNumberLabel: cell.pokemonNumber, pokemonNameLabel: cell.pokemonName, pokemonGenusLabel: cell.pokemonGenus, pokemonDexDetail: cell.pokemonDexDetail, pokemonSprite: cell.pokemonSprite, type1Icon: cell.pokemonType1Icon, type1Text: cell.pokemonType1Text, type1Background: cell.pokemonType1Background, type2Icon: cell.pokemonType2Icon, type2Text: cell.pokemonType2Text, type2Background: cell.pokemonType2Background)

            let action = UIAction { _ in
                Task {
                    self.todaysPokemon = try await self.requestPokemonDexAsyncData(pokemonDexNumber: Int.random(in: 1...1025))
                    self.requestPokemonDexData(pokemonNumberLabel: cell.pokemonNumber, pokemonNameLabel: cell.pokemonName, pokemonGenusLabel: cell.pokemonGenus, pokemonDexDetail: cell.pokemonDexDetail, pokemonSprite: cell.pokemonSprite, type1Icon: cell.pokemonType1Icon, type1Text: cell.pokemonType1Text, type1Background: cell.pokemonType1Background, type2Icon: cell.pokemonType2Icon, type2Text: cell.pokemonType2Text, type2Background: cell.pokemonType2Background)
                }

                UIView.animate(withDuration: 1) {
                    cell.titleImageButton.transform = CGAffineTransform(rotationAngle: .pi)
                }

                UIView.animate(withDuration: 1) {
                    cell.titleImageButton.transform = CGAffineTransform(rotationAngle: .ulpOfOne)
                }
            }

            cell.titleImageButton.addAction(action, for: .touchUpInside)
        }

        let pokemonDexHeaderRegistration = UICollectionView.SupplementaryRegistration<PokemonDexHeader>(elementKind: PokemonDexHeader.identifier) { header, elementKind, indexPath in }

        let pokemonDexGridCellRegistration = UICollectionView.CellRegistration<PokemonDexGridCell, Int> { (cell, indexPath, pokemonDexNumber) in
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
                    cell.configureThumbnailImage(thumbnailImage: image)
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
                    cell.configureGridText(pokemonDexNumber: pokemonDexNumber, pokemonName: json.names.filter { $0.language.name == "ko" }.isEmpty ? json.names[0].name : json.names.filter { $0.language.name == "ko" }[0].name)
                }
            }.resume()
        }

        pokemonDexGridDataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: pokemonDexListCollectionView, cellProvider: { collectionView, indexPath, item in
            guard let section = Section(rawValue: indexPath.section) else { fatalError() }
            switch section {
                case .todaysPokemon:
                    return collectionView.dequeueConfiguredReusableCell(using: todaysPokemonCellRegistration, for: indexPath, item: item)
                case .pokemonDexGrid:
                    return collectionView.dequeueConfiguredReusableCell(using: pokemonDexGridCellRegistration, for: indexPath, item: item)
            }
        })

        pokemonDexGridDataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            return collectionView.dequeueConfiguredReusableSupplementary(using: pokemonDexHeaderRegistration, for: indexPath)
        }
    }

    private func applyPokemonDexGridSnapshot() {
        var snapshot = pokemonDexGridDataSource.snapshot()
        snapshot.appendSections([.todaysPokemon, .pokemonDexGrid])
        snapshot.appendItems([0], toSection: .todaysPokemon)
        snapshot.appendItems(Array(1...1025), toSection: .pokemonDexGrid)
        pokemonDexGridDataSource.apply(snapshot)
    }

}
