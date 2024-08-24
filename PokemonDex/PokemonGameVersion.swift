//
//  PokemonGameVersion.swift
//  PokemonDex
//
//  Created by 김민택 on 8/23/24.
//

import UIKit

enum PokemonGameVersion: String, CaseIterable {
    case red = "red"
    case blue = "blue"
    case yellow = "yellow"
    case gold = "gold"
    case silver = "silver"
    case crystal = "crystal"
    case ruby = "ruby"
    case sapphire = "sapphire"
    case emerald = "emerald"
    case fireRed = "firered"
    case leafGreen = "leafgreen"
    case diamond = "diamond"
    case pearl = "pearl"
    case platinum = "platinum"
    case heartGold = "heartgold"
    case soulSilver = "soulsilver"
    case black = "black"
    case white = "white"
    case colosseum = "colosseum"
    case xd = "XD"
    case black2 = "black-2"
    case white2 = "white-2"
    case x = "x"
    case y = "y"
    case omegaRuby = "omega-ruby"
    case alphaSapphire = "alpha-sapphire"
    case sun = "sun"
    case moon = "moon"
    case ultraSun = "ultra-sun"
    case ultraMoon = "ultra-moon"
    case lgp = "lets-go-pikachu"
    case lge = "lets-go-eevee"
    case sword = "sword"
    case shield = "shield"
    case theIsleOfArmor = "the-isle-of-armor"
    case theCrownTundra = "the-crown-tundra"
    case brilliantDiamond = "brilliant-diamond"
    case shiningPearl = "shining-pearl"
    case legendsArceus = "legends-arceus"
    case scarlet = "scarlet"
    case violet = "violet"
    case theTealMask = "the-teal-mask"
    case theIndigoDisk = "the-indigo-disk"

    func configureVersionName() -> String {
        switch self {
            case .red:
                return "레드"
            case .blue:
                return "블루"
            case .yellow:
                return "피카츄"
            case .gold:
                return "골드"
            case .silver:
                return "실버"
            case .crystal:
                return "크리스탈"
            case .ruby:
                return "루비"
            case .sapphire:
                return "사파이어"
            case .emerald:
                return "에메랄드"
            case .fireRed:
                return "파이어레드"
            case .leafGreen:
                return "리프그린"
            case .diamond:
                return "디아루가"
            case .pearl:
                return "펄기아"
            case .platinum:
                return "기라티나"
            case .heartGold:
                return "하트골드"
            case .soulSilver:
                return "소울실버"
            case .black:
                return "블랙"
            case .white:
                return "화이트"
            case .colosseum:
                return "콜로세움"
            case .xd:
                return "XD"
            case .black2:
                return "블랙 2"
            case .white2:
                return "화이트 2"
            case .x:
                return "X"
            case .y:
                return "Y"
            case .omegaRuby:
                return "오메가루비"
            case .alphaSapphire:
                return "알파사파이어"
            case .sun:
                return "썬"
            case .moon:
                return "문"
            case .ultraSun:
                return "울트라썬"
            case .ultraMoon:
                return "울트라문"
            case .lgp:
                return "레츠고! 피카츄"
            case .lge:
                return "레츠고! 이브이"
            case .sword:
                return "소드"
            case .shield:
                return "실드"
            case .theIsleOfArmor:
                return "갑옷의 외딴섬"
            case .theCrownTundra:
                return "왕관의 설원"
            case .brilliantDiamond:
                return "브릴리언트 다이아몬드"
            case .shiningPearl:
                return "샤이닝 펄"
            case .legendsArceus:
                return "LEGENDS 아르세우스"
            case .scarlet:
                return "스칼렛"
            case .violet:
                return "바이올렛"
            case .theTealMask:
                return "벽록의 가면"
            case .theIndigoDisk:
                return "남청의 원반"
        }
    }

}
