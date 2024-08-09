//
//  TodaysPokemonViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/9/24.
//

import UIKit

struct PokemonInfo: Codable {
    var abilities: [PokemonAbility]
    var baseExperience: Int
    var cries: PokemonCries
    var forms: [PokemonForm]
    var gameIndices: [PokemonGameIndex]
    var height: Int
    var id: Int
    var isDefault: Bool
    var locationAreaEncounters: String
    var moves: [PokemonMove]
    var name: String
    var order: Int
    var species: PokemonSpecies
    var sprites: PokemonSprites
    var stats: [PokemonStat]
    var types: [PokemonType]
    var weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries
        case forms
        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case name
        case order
        case species
        case sprites
        case stats
        case types
        case weight
    }
}

struct PokemonAbility: Codable {
    var ability: PokemonAbilityComponent
    var isHidden: Bool
    var slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct PokemonAbilityComponent: Codable {
    var name: String
    var url: String
}

struct PokemonCries: Codable {
    var latest: String
    var legacy: String?
}

struct PokemonForm: Codable {
    var name: String
    var url: String
}

struct PokemonGameIndex: Codable {
    var gameIndex: Int
    var version: PokemonGameIndexVersion

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

struct PokemonGameIndexVersion: Codable {
    var name: String
    var url: String
}

struct PokemonMove: Codable {
    var move: PokemonMoveComponent
    var versionGroupDetails: [PokemonMoveVersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct PokemonMoveComponent: Codable {
    var name: String
    var url: String
}

struct PokemonMoveVersionGroupDetail: Codable {
    var levelLearnedAt: Int
    var moveLearnMethod: PokemonMoveLearnMethod
    var versionGroup: PokemonMoveVersionGroup

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

struct PokemonMoveLearnMethod: Codable {
    var name: String
    var url: String
}

struct PokemonMoveVersionGroup: Codable {
    var name: String
    var url: String
}

struct PokemonSpecies: Codable {
    var name: String
    var url: String
}

struct PokemonSprites: Codable {
    var backDefault: String?
    var backFemale: String?
    var backShiny: String?
    var backShinyFemale: String?
    var frontDefault: String?
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyFemale: String?
    var other: PokemonSpritesOther
    var versions: PokemonSpritesVersions

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other
        case versions
    }
}

struct PokemonSpritesComponent: Codable {
    var backDefault: String?
    var backGray: String?
    var backTransparent: String?
    var backFemale: String?
    var backShiny: String?
    var backShinyTransparent: String?
    var backShinyFemale: String?
    var frontDefault: String?
    var frontGray: String?
    var frontTransparent: String?
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyTransparent: String?
    var frontShinyFemale: String?
    var animated: PokemonAnimatedSpritesComponent?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontShinyFemale = "front_shiny_female"
        case animated
    }
}

struct PokemonAnimatedSpritesComponent: Codable {
    var backDefault: String?
    var backGray: String?
    var backTransparent: String?
    var backFemale: String?
    var backShiny: String?
    var backShinyTransparent: String?
    var backShinyFemale: String?
    var frontDefault: String?
    var frontGray: String?
    var frontTransparent: String?
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyTransparent: String?
    var frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct PokemonSpritesOther: Codable {
    var dreamWorld: PokemonSpritesComponent
    var home: PokemonSpritesComponent
    var officialArtwork: PokemonSpritesComponent
    var showdown: PokemonSpritesComponent

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
        case showdown
    }
}

struct PokemonSpritesVersions: Codable {
    var generationI: PokemonSpritesGenerationI
    var generationII: PokemonSpritesGenerationII
    var generationIII: PokemonSpritesGenerationIII
    var generationIV: PokemonSpritesGenerationIV
    var generationV: PokemonSpritesGenerationV
    var generationVI: PokemonSpritesGenerationVI
    var generationVII: PokemonSpritesGenerationVII
    var generationVIII: PokemonSpritesGenerationVIII

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationII = "generation-ii"
        case generationIII = "generation-iii"
        case generationIV = "generation-iv"
        case generationV = "generation-v"
        case generationVI = "generation-vi"
        case generationVII = "generation-vii"
        case generationVIII = "generation-viii"
    }
}

struct PokemonSpritesGenerationI: Codable {
    var redBlue: PokemonSpritesComponent
    var yellow: PokemonSpritesComponent

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

struct PokemonSpritesGenerationII: Codable {
    var crystal: PokemonSpritesComponent
    var gold: PokemonSpritesComponent
    var silver: PokemonSpritesComponent
}

struct PokemonSpritesGenerationIII: Codable {
    var emerald: PokemonSpritesComponent
    var fireredLeafgreen: PokemonSpritesComponent
    var rubySapphire: PokemonSpritesComponent

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

struct PokemonSpritesGenerationIV: Codable {
    var diamondPearl: PokemonSpritesComponent
    var heartgoldSoulsilver: PokemonSpritesComponent
    var platinum: PokemonSpritesComponent

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

struct PokemonSpritesGenerationV: Codable {
    var blackWhite: PokemonSpritesComponent

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

struct PokemonSpritesGenerationVI: Codable {
    var omegarubyAlphasapphire: PokemonSpritesComponent
    var xy: PokemonSpritesComponent

    enum CodingKeys: String, CodingKey {
        case omegarubyAlphasapphire = "omegaruby-alphasapphire"
        case xy = "x-y"
    }
}

struct PokemonSpritesGenerationVII: Codable {
    var icons: PokemonSpritesComponent
    var ultraSunUltraMoon: PokemonSpritesComponent

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

struct PokemonSpritesGenerationVIII: Codable {
    var icons: PokemonSpritesComponent
}

struct PokemonStat: Codable {
    var baseStat: Int
    var effort: Int
    var stat: PokemonStatComponent

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct PokemonStatComponent: Codable {
    var name: String
    var url: String
}

struct PokemonType: Codable {
    var slot: Int
    var type: PokemonTypeComponent
}

struct PokemonTypeComponent: Codable {
    var name: String
    var url: String
}

struct PokemonSpeciesInfo: Codable {
    var flavorTextEntries: [PokedexFlavorText]
    var genera: [PokedexGenus]
    var id: Int
    var name: String
    var names: [PokedexName]
    var order: Int
    var pokedexNumbers: [PokedexNumber]

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
        case genera
        case id
        case name
        case names
        case order
        case pokedexNumbers = "pokedex_numbers"
    }
}

struct PokedexFlavorText: Codable {
    var flavorText: String
    var language: PokedexLanguage
    var version: PokedexVersion

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case version
    }
}

struct PokedexLanguage: Codable {
    var name: String
    var url: String
}

struct PokedexVersion: Codable {
    var name: String
    var url: String
}

struct PokedexGenus: Codable {
    var genus: String
    var language: PokedexLanguage
}

struct PokedexName: Codable {
    var language: PokedexLanguage
    var name: String
}

struct PokedexNumber: Codable {
    var entryNumber: Int
    var pokedex: PokedexNumberInfo

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

struct PokedexNumberInfo: Codable {
    var name: String
    var url: String
}

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

    private let titleImageView: UIImageView = {
        $0.image = #imageLiteral(resourceName: "MonsterBall")
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

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
        $0.distribution = .fillProportionally
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

    private let pokemonDexDetail: UILabel = {
        $0.text = "설명"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

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

        titleStack.addArrangedSubview(titleImageView)
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
            titleImageView.widthAnchor.constraint(equalToConstant: 21),
            titleImageView.heightAnchor.constraint(equalToConstant: 21),
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

            guard let json = try? JSONDecoder().decode(PokemonInfo.self, from: data) else {
                print("Error: Data Decoding error")
                return
            }

            DispatchQueue.main.async {
                switch json.types.filter { $0.slot == 1 }[0].type.name {
                case "normal":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Normal")
                    self.pokemonType1Text.text = "노말"
                    self.pokemonType1Background.backgroundColor = TypeColor.normal
                case "fire":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Fire")
                    self.pokemonType1Text.text = "불꽃"
                    self.pokemonType1Background.backgroundColor = TypeColor.fire
                case "water":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Water")
                    self.pokemonType1Text.text = "물"
                    self.pokemonType1Background.backgroundColor = TypeColor.water
                case "grass":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Grass")
                    self.pokemonType1Text.text = "풀"
                    self.pokemonType1Background.backgroundColor = TypeColor.grass
                case "electric":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Electric")
                    self.pokemonType1Text.text = "전기"
                    self.pokemonType1Background.backgroundColor = TypeColor.electric
                case "ice":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Ice")
                    self.pokemonType1Text.text = "얼음"
                    self.pokemonType1Background.backgroundColor = TypeColor.ice
                case "fighting":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Fighting")
                    self.pokemonType1Text.text = "격투"
                    self.pokemonType1Background.backgroundColor = TypeColor.fighting
                case "poison":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Poison")
                    self.pokemonType1Text.text = "독"
                    self.pokemonType1Background.backgroundColor = TypeColor.poison
                case "ground":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Ground")
                    self.pokemonType1Text.text = "땅"
                    self.pokemonType1Background.backgroundColor = TypeColor.ground
                case "flying":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Flying")
                    self.pokemonType1Text.text = "비행"
                    self.pokemonType1Background.backgroundColor = TypeColor.flying
                case "psychic":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Psychic")
                    self.pokemonType1Text.text = "에스퍼"
                    self.pokemonType1Background.backgroundColor = TypeColor.psychic
                case "bug":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Bug")
                    self.pokemonType1Text.text = "벌레"
                    self.pokemonType1Background.backgroundColor = TypeColor.bug
                case "rock":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Rock")
                    self.pokemonType1Text.text = "바위"
                    self.pokemonType1Background.backgroundColor = TypeColor.rock
                case "ghost":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Ghost")
                    self.pokemonType1Text.text = "고스트"
                    self.pokemonType1Background.backgroundColor = TypeColor.ghost
                case "dragon":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Dragon")
                    self.pokemonType1Text.text = "드래곤"
                    self.pokemonType1Background.backgroundColor = TypeColor.dragon
                case "dark":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Dark")
                    self.pokemonType1Text.text = "악"
                    self.pokemonType1Background.backgroundColor = TypeColor.dark
                case "steel":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Steel")
                    self.pokemonType1Text.text = "강철"
                    self.pokemonType1Background.backgroundColor = TypeColor.steel
                case "fairy":
                    self.pokemonType1Icon.image = #imageLiteral(resourceName: "Fairy")
                    self.pokemonType1Text.text = "페어리"
                    self.pokemonType1Background.backgroundColor = TypeColor.fairy
                default:
                    break
                }

                if !json.types.filter { $0.slot == 2 }.isEmpty {
                    switch json.types.filter { $0.slot == 2 }[0].type.name {
                    case "normal":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Normal")
                        self.pokemonType2Text.text = "노말"
                        self.pokemonType2Background.backgroundColor = TypeColor.normal
                    case "fire":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Fire")
                        self.pokemonType2Text.text = "불꽃"
                        self.pokemonType2Background.backgroundColor = TypeColor.fire
                    case "water":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Water")
                        self.pokemonType2Text.text = "물"
                        self.pokemonType2Background.backgroundColor = TypeColor.water
                    case "grass":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Grass")
                        self.pokemonType2Text.text = "풀"
                        self.pokemonType2Background.backgroundColor = TypeColor.grass
                    case "electric":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Electric")
                        self.pokemonType2Text.text = "전기"
                        self.pokemonType2Background.backgroundColor = TypeColor.electric
                    case "ice":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Ice")
                        self.pokemonType2Text.text = "얼음"
                        self.pokemonType2Background.backgroundColor = TypeColor.ice
                    case "fighting":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Fighting")
                        self.pokemonType2Text.text = "격투"
                        self.pokemonType2Background.backgroundColor = TypeColor.fighting
                    case "poison":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Poison")
                        self.pokemonType2Text.text = "독"
                        self.pokemonType2Background.backgroundColor = TypeColor.poison
                    case "ground":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Ground")
                        self.pokemonType2Text.text = "땅"
                        self.pokemonType2Background.backgroundColor = TypeColor.ground
                    case "flying":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Flying")
                        self.pokemonType2Text.text = "비행"
                        self.pokemonType2Background.backgroundColor = TypeColor.flying
                    case "psychic":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Psychic")
                        self.pokemonType2Text.text = "에스퍼"
                        self.pokemonType2Background.backgroundColor = TypeColor.psychic
                    case "bug":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Bug")
                        self.pokemonType2Text.text = "벌레"
                        self.pokemonType2Background.backgroundColor = TypeColor.bug
                    case "rock":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Rock")
                        self.pokemonType2Text.text = "바위"
                        self.pokemonType2Background.backgroundColor = TypeColor.rock
                    case "ghost":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Ghost")
                        self.pokemonType2Text.text = "고스트"
                        self.pokemonType2Background.backgroundColor = TypeColor.ghost
                    case "dragon":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Dragon")
                        self.pokemonType2Text.text = "드래곤"
                        self.pokemonType2Background.backgroundColor = TypeColor.dragon
                    case "dark":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Dark")
                        self.pokemonType2Text.text = "악"
                        self.pokemonType2Background.backgroundColor = TypeColor.dark
                    case "steel":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Steel")
                        self.pokemonType2Text.text = "강철"
                        self.pokemonType2Background.backgroundColor = TypeColor.steel
                    case "fairy":
                        self.pokemonType2Icon.image = #imageLiteral(resourceName: "Fairy")
                        self.pokemonType2Text.text = "페어리"
                        self.pokemonType2Background.backgroundColor = TypeColor.fairy
                    default:
                        break
                    }
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

            guard let json = try? JSONDecoder().decode(PokemonSpeciesInfo.self, from: data) else {
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
    }

}
