//
//  UtilityModel.swift
//  PokemonDex
//
//  Created by 김민택 on 8/10/24.
//

import Foundation

struct APIResource: Codable {
    var url: String
}

struct Description: Codable {
    var description: String
    var language: NamedAPIResource
}

struct FlavorText: Codable {
    var flavorText: String
    var language: NamedAPIResource
    var version: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case version
    }
}

struct NameModel: Codable {
    var name: String
    var language: NamedAPIResource
}

struct NamedAPIResource: Codable {
    var name: String
    var url: String
}

struct VersionGameIndex: Codable {
    var gameIndex: Int
    var version: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}
