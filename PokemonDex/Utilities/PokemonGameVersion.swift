//
//  PokemonGameVersion.swift
//  PokemonDex
//
//  Created by 김민택 on 8/23/24.
//

import UIKit

enum PokemonGameVersion: String, CaseIterable {
    case none = "none"
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
            case .none:
                return "정보 없음"
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

    func configureVersionColor() -> UIColor {
        switch self {
            case .none:
                return .black
            case .red:
                return #colorLiteral(red: 0.9872214198, green: 0.02776993625, blue: 0.1776115596, alpha: 1)
            case .blue:
                return #colorLiteral(red: 0.2375460267, green: 0.4122451842, blue: 0.7074590921, alpha: 1)
            case .yellow:
                return #colorLiteral(red: 0.9960586429, green: 0.878088057, blue: 0.06920240819, alpha: 1)
            case .gold:
                return #colorLiteral(red: 0.9549127221, green: 0.7405667901, blue: 0.0102605857, alpha: 1)
            case .silver:
                return #colorLiteral(red: 0.7845865488, green: 0.9056451917, blue: 0.9891819358, alpha: 1)
            case .crystal:
                return #colorLiteral(red: 0.4125355482, green: 0.3342987299, blue: 0.4383142591, alpha: 1)
            case .ruby:
                return #colorLiteral(red: 0.8363432884, green: 0.2572698593, blue: 0.2343947589, alpha: 1)
            case .sapphire:
                return #colorLiteral(red: 0.2724832594, green: 0.5316601396, blue: 0.8556486964, alpha: 1)
            case .emerald:
                return #colorLiteral(red: 0.2192952931, green: 0.6998054981, blue: 0.4582480788, alpha: 1)
            case .fireRed:
                return #colorLiteral(red: 0.9178231359, green: 0.2593289018, blue: 0.04524021596, alpha: 1)
            case .leafGreen:
                return #colorLiteral(red: 0.6621687412, green: 0.804192543, blue: 0.1656166911, alpha: 1)
            case .diamond:
                return #colorLiteral(red: 0.4584398866, green: 0.6443131566, blue: 0.7943369746, alpha: 1)
            case .pearl:
                return #colorLiteral(red: 0.8531146646, green: 0.6918874383, blue: 0.7210992575, alpha: 1)
            case .platinum:
                return #colorLiteral(red: 0.8061820865, green: 0.7225016356, blue: 0.378385365, alpha: 1)
            case .heartGold:
                return #colorLiteral(red: 1, green: 0.9715375304, blue: 0.694054544, alpha: 1)
            case .soulSilver:
                return #colorLiteral(red: 0.8504073024, green: 0.8753228784, blue: 0.8963804841, alpha: 1)
            case .black:
                return #colorLiteral(red: 0.09188076109, green: 0.08200898021, blue: 0.08649811894, alpha: 1)
            case .white:
                return #colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 1)
            case .colosseum:
                return #colorLiteral(red: 0.8626797199, green: 0.7691994309, blue: 0.5268123746, alpha: 1)
            case .xd:
                return #colorLiteral(red: 0.9805395007, green: 0.7804870009, blue: 0.4140536487, alpha: 1)
            case .black2:
                return #colorLiteral(red: 0.1459518969, green: 0.1165554747, blue: 0.1084592864, alpha: 1)
            case .white2:
                return #colorLiteral(red: 0.9058824182, green: 0.9058822989, blue: 0.9015743732, alpha: 1)
            case .x:
                return #colorLiteral(red: 0.02674455196, green: 0.3228054047, blue: 0.5792497993, alpha: 1)
            case .y:
                return #colorLiteral(red: 0.6760847569, green: 0.05990961939, blue: 0.1342695355, alpha: 1)
            case .omegaRuby:
                return #colorLiteral(red: 0.8877932429, green: 0.1337813735, blue: 0.2375866175, alpha: 1)
            case .alphaSapphire:
                return #colorLiteral(red: 0.09750121087, green: 0.3342819214, blue: 0.6117435098, alpha: 1)
            case .sun:
                return #colorLiteral(red: 0.9693110585, green: 0.8465139866, blue: 0.04175425321, alpha: 1)
            case .moon:
                return #colorLiteral(red: 0.4591799378, green: 0.7605519891, blue: 0.934501946, alpha: 1)
            case .ultraSun:
                return #colorLiteral(red: 0.9947518706, green: 0.8331705928, blue: 0.1582370102, alpha: 1)
            case .ultraMoon:
                return #colorLiteral(red: 0.5512629151, green: 0.7466254234, blue: 0.8882303834, alpha: 1)
            case .lgp:
                return #colorLiteral(red: 0.9621109366, green: 0.7813293338, blue: 0.05673216283, alpha: 1)
            case .lge:
                return #colorLiteral(red: 0.7780203223, green: 0.4508313537, blue: 0.160946995, alpha: 1)
            case .sword:
                return #colorLiteral(red: 0.01841805503, green: 0.3029564619, blue: 0.6253349781, alpha: 1)
            case .shield:
                return #colorLiteral(red: 0.4893606901, green: 0.01651152223, blue: 0.001352610416, alpha: 1)
            case .theIsleOfArmor:
                return #colorLiteral(red: 0.9505909085, green: 0.8472730517, blue: 0.1573674083, alpha: 1)
            case .theCrownTundra:
                return #colorLiteral(red: 0.01682768203, green: 0.4700337052, blue: 0.5298088789, alpha: 1)
            case .brilliantDiamond:
                return #colorLiteral(red: 0.1431352198, green: 0.6406204104, blue: 0.9049867988, alpha: 1)
            case .shiningPearl:
                return #colorLiteral(red: 0.8642807603, green: 0.7854510546, blue: 0.8897984624, alpha: 1)
            case .legendsArceus:
                return #colorLiteral(red: 0.5001068711, green: 0.7557575107, blue: 0.6046666503, alpha: 1)
            case .scarlet:
                return #colorLiteral(red: 0.8852034211, green: 0.01397596486, blue: 0.07024814934, alpha: 1)
            case .violet:
                return #colorLiteral(red: 0.6315546632, green: 0.2231458426, blue: 0.4929769039, alpha: 1)
            case .theTealMask:
                return #colorLiteral(red: 0.1103086099, green: 0.7323105931, blue: 0.6880854964, alpha: 1)
            case .theIndigoDisk:
                return #colorLiteral(red: 0.01168273855, green: 0.2910616398, blue: 0.6873884201, alpha: 1)
        }
    }
}
