//
//  UtilityModel.swift
//  PokemonDex
//
//  Created by 김민택 on 8/10/24.
//

import Foundation

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

struct NamedAPIResource: Codable {
    var name: String
    var url: String
}
