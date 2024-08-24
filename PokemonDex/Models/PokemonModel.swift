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
    /// 포켓몬의 키 (cm)
    var height: Int
    /// 포켓몬의 무게 (hg / 0.1kg)
    var weight: Int
    /// 포켓몬이 잠재적으로 가질 수 있는 특성 목록
    var abilities: [PokemonAbility]
    /// 해당 포켓몬의 종족값 목록
    var stats: [PokemonStat]
    /// 해당 포켓몬이 가진 타입 목록
    var types: [PokemonTypeModel]
 }
 ```
 */
struct PokemonModel: Codable {
    /// 포켓몬의 id
    var id: Int
    /// 포켓몬의 키 (cm)
    var height: Int
    /// 포켓몬의 무게 (hg / 0.1kg)
    var weight: Int
    /// 포켓몬이 잠재적으로 가질 수 있는 특성 목록
    var abilities: [PokemonAbility]
    /// 해당 포켓몬의 종족값 목록
    var stats: [PokemonStat]
    /// 해당 포켓몬이 가진 타입 목록
    var types: [PokemonTypeModel]

    enum CodingKeys: String, CodingKey {
        case id
        case height
        case weight
        case abilities
        case stats
        case types
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

struct PokemonStat: Codable {
    var stat: NamedAPIResource
    var baseStat: Int

    enum CodingKeys: String, CodingKey {
        case stat
        case baseStat = "base_stat"
    }
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
