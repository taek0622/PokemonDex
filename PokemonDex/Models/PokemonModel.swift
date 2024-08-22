//
//  Model.swift
//  PokemonDex
//
//  Created by 김민택 on 8/10/24.
//

import Foundation

struct PokemonInfo {
    var id: Int
    var pokemon: PokemonModel?
    var species: PokemonSpeciesModel?
    var sprite: Data?
}

/**
 포켓몬의 정보를 가져오는 데 필요한 데이터
 
 ```swift
 struct PokemonModel {
     /// 포켓몬의 id
     var id: Int
     /// 포켓몬의 이름
     var name: String
     /// 포켓몬의 키 (cm)
     var height: Int
     var isDefault: Bool
     /// 정렬 순서. 같은 종의 서로 다른 폼 등이 그룹화되는 것을 제외하고는 거의 세대별 순서
     var order: Int
     /// 포켓몬의 무게 (hg / 0.1kg)
     var weight: Int
     /// 포켓몬이 잠재적으로 가질 수 있는 특성 목록
     var abilities: [PokemonAbility]
     /// 포켓몬이 가질 수 있는 폼(형태) 목록
     var forms: [PokemonForm]
     /// 세대별 포켓몬과 관련된 게임 목록
     var gameIndices: [VersionGameIndex]
     /// 해당 포켓몬이 특정 버전에서 기술을 배우는 방법 및 레벨 등의 세부 정보를 포함한 기술 정보 목록
     var moves: [PokemonMove]
     /// 해당 포켓몬이 속한 종 (해당 포켓몬의 PokemonSpecies API url)
     var species: NamedAPIResource
     /// 게임에서 해당 포켓몬을 묘사하는 데 사용되는 스프라이트 세트
     var sprites: PokemonSprites
     /// 게임에서 해당 포켓몬을 묘사하는 데 사용되는 울음소리 세트
     var cries: PokemonCries
     /// 해당 포켓몬의 종족값 목록
     var stats: [PokemonStat]
     /// 해당 포켓몬이 가진 타입 목록
     var types: [PokemonTypeModel]
     /// 해당 포켓몬이 이전 세대에서 가졌던 타입 목록
     var pastTypes: [PokemonTypePast]
 }
 ```
 */
struct PokemonModel: Codable {
    /// 포켓몬의 id
    var id: Int
    /// 포켓몬의 이름
    var name: String
    /// 포켓몬의 키 (cm)
    var height: Int
    var isDefault: Bool
    /// 정렬 순서. 같은 종의 서로 다른 폼 등이 그룹화되는 것을 제외하고는 거의 세대별 순서
    var order: Int
    /// 포켓몬의 무게 (hg / 0.1kg)
    var weight: Int
    /// 포켓몬이 잠재적으로 가질 수 있는 특성 목록
    var abilities: [PokemonAbility]
    /// 포켓몬이 가질 수 있는 폼(형태) 목록
    var forms: [NamedAPIResource]
    /// 세대별 포켓몬과 관련된 게임 목록
    var gameIndices: [VersionGameIndex]
    /// 해당 포켓몬이 특정 버전에서 기술을 배우는 방법 및 레벨 등의 세부 정보를 포함한 기술 정보 목록
    var moves: [PokemonMove]
    /// 해당 포켓몬이 속한 종 (해당 포켓몬의 PokemonSpecies API url)
    var species: NamedAPIResource
    /// 게임에서 해당 포켓몬을 묘사하는 데 사용되는 스프라이트 세트
    var sprites: PokemonSprites
    /// 게임에서 해당 포켓몬을 묘사하는 데 사용되는 울음소리 세트
    var cries: PokemonCries
    /// 해당 포켓몬의 종족값 목록
    var stats: [PokemonStat]
    /// 해당 포켓몬이 가진 타입 목록
    var types: [PokemonTypeModel]
    /// 해당 포켓몬이 이전 세대에서 가졌던 타입 목록
    var pastTypes: [PokemonTypePast]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case height
        case isDefault = "is_default"
        case order
        case weight
        case abilities
        case forms
        case gameIndices = "game_indices"
        case moves
        case species
        case sprites
        case cries
        case stats
        case types
        case pastTypes = "past_types"
    }
}

struct PokemonAbility: Codable {
    var isHidden: Bool
    var slot: Int
    var ability: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
        case ability
    }
}

struct PokemonTypeModel: Codable {
    var slot: Int
    var type: NamedAPIResource
}

struct PokemonTypePast: Codable {
    var generation: NamedAPIResource
    var types: [PokemonTypeModel]
}

struct PokemonMove: Codable {
    var move: NamedAPIResource
    var versionGroupDetails: [PokemonMoveVersion]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct PokemonMoveVersion: Codable {
    var moveLearnMethod: NamedAPIResource
    var versionGroup: NamedAPIResource
    var levelLearnedAt: Int

    enum CodingKeys: String, CodingKey {
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
        case levelLearnedAt = "level_learned_at"
    }
}

struct PokemonStat: Codable {
    var stat: NamedAPIResource
    var effort: Int
    var baseStat: Int

    enum CodingKeys: String, CodingKey {
        case stat
        case effort
        case baseStat = "base_stat"
    }
}

struct PokemonCries: Codable {
    var latest: String
    var legacy: String?
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

/**
 ```swift
 struct PokemonSpeciesModel: Codable {
     /// 포켓몬의 id
     var id: Int
     /// 포켓몬의 이름
     var name: String
     /// 정렬 순서. 같은 종의 서로 다른 폼 등이 그룹화되는 것을 제외하고는 거의 세대별 순서
     var order: Int
     /// 베이비 포켓몬 여부
     var isBaby: Bool
     /// 전설의 포켓몬 여부
     var isLegendary: Bool
     /// 환상의 포켓몬 여부
     var isMythical: Bool
     /// 해당 포켓몬의 성별별 다른 외형 여부
     var hasGenderDifferences: Bool
     /// 해당 포켓몬이 여러 형태를 가지고 있는지 여부
     var formsSwitchable: Bool
     /// 전국 도감 및 지역 도감 번호 목록
     var pokedexNumbers: [PokemonSpeciesDexEntry]
     /// 해당 포켓몬으로 진화하는 포켓몬
     var evolvesFromSpecies: NamedAPIResource?
     /// 해당 포켓몬의 진화 트리
     var evolutionChain: APIResource?
     /// 해당 포켓몬이 처음으로 추가된 세대
     var generation: NamedAPIResource?
     /// 해당 포켓몬의 다국어 이름 목록
     var names: [NameModel]
     /// 해당 포켓몬의 다국어 및 버전별 도감 설명 목록
     var flavorTextEntries: [FlavorText]
     /// 해당 포켓몬의 다국어 분류 목록
     var genera: [Genus]
     /// 해당 포켓몬에 속하는 포켓몬 목록 (서브 폼)
     var varieties: [PokemonSpeciesVariety]
 }
 ```
 */
struct PokemonSpeciesModel: Codable {
    /// 포켓몬의 id
    var id: Int
    /// 포켓몬의 이름
    var name: String
    /// 정렬 순서. 같은 종의 서로 다른 폼 등이 그룹화되는 것을 제외하고는 거의 세대별 순서
    var order: Int
    /// 베이비 포켓몬 여부
    var isBaby: Bool
    /// 전설의 포켓몬 여부
    var isLegendary: Bool
    /// 환상의 포켓몬 여부
    var isMythical: Bool
    /// 해당 포켓몬의 성별별 다른 외형 여부
    var hasGenderDifferences: Bool
    /// 해당 포켓몬이 여러 형태를 가지고 있는지 여부
    var formsSwitchable: Bool
    /// 전국 도감 및 지역 도감 번호 목록
    var pokedexNumbers: [PokemonSpeciesDexEntry]
    /// 해당 포켓몬으로 진화하는 포켓몬
    var evolvesFromSpecies: NamedAPIResource?
    /// 해당 포켓몬의 진화 트리
    var evolutionChain: APIResource?
    /// 해당 포켓몬이 처음으로 추가된 세대
    var generation: NamedAPIResource?
    /// 해당 포켓몬의 다국어 이름 목록
    var names: [NameModel]
    /// 해당 포켓몬의 다국어 및 버전별 도감 설명 목록
    var flavorTextEntries: [FlavorText]
    /// 해당 포켓몬의 다국어 분류 목록
    var genera: [Genus]
    /// 해당 포켓몬에 속하는 포켓몬 목록 (서브 폼)
    var varieties: [PokemonSpeciesVariety]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case order
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case hasGenderDifferences = "has_gender_differences"
        case formsSwitchable = "forms_switchable"
        case pokedexNumbers = "pokedex_numbers"
        case evolvesFromSpecies = "evolves_from_species"
        case evolutionChain = "evolution_chain"
        case generation
        case names
        case flavorTextEntries = "flavor_text_entries"
        case genera
        case varieties
    }
}

struct Genus: Codable {
    var genus: String
    var language: NamedAPIResource
}

struct PokemonSpeciesDexEntry: Codable {
    var entryNumber: Int
    var pokedex: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

struct PokemonSpeciesVariety: Codable {
    var isDefault: Bool
    var pokemon: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
}
