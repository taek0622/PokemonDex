//
//  PokemonType.swift
//  PokemonDex
//
//  Created by 김민택 on 8/9/24.
//

import UIKit

enum PokemonType: String {
    case normal = "normal"
    case fire = "fire"
    case water = "water"
    case grass = "grass"
    case electric = "electric"
    case ice = "ice"
    case fighting = "fighting"
    case poison = "poison"
    case ground = "ground"
    case flying = "flying"
    case psychic = "psychic"
    case bug = "bug"
    case rock = "rock"
    case ghost = "ghost"
    case dragon = "dragon"
    case dark = "dark"
    case steel = "steel"
    case fairy = "fairy"

    func configureTypeColor() -> UIColor {
        switch self {
            case .normal:
                return #colorLiteral(red: 0.5764705882, green: 0.6, blue: 0.6235294118, alpha: 1)
            case .fire:
                return #colorLiteral(red: 0.9137254902, green: 0.6274509804, blue: 0.3490196078, alpha: 1)
            case .water:
                return #colorLiteral(red: 0.4078431373, green: 0.5607843137, blue: 0.8235294118, alpha: 1)
            case .grass:
                return #colorLiteral(red: 0.4980392157, green: 0.7176470588, blue: 0.3764705882, alpha: 1)
            case .electric:
                return #colorLiteral(red: 0.9137254902, green: 0.8235294118, blue: 0.2862745098, alpha: 1)
            case .ice:
                return #colorLiteral(red: 0.5803921569, green: 0.8, blue: 0.7529411765, alpha: 1)
            case .fighting:
                return #colorLiteral(red: 0.7137254902, green: 0.2941176471, blue: 0.4156862745, alpha: 1)
            case .poison:
                return #colorLiteral(red: 0.6235294118, green: 0.431372549, blue: 0.7725490196, alpha: 1)
            case .ground:
                return #colorLiteral(red: 0.768627451, green: 0.4862745098, blue: 0.2901960784, alpha: 1)
            case .flying:
                return #colorLiteral(red: 0.5960784314, green: 0.6588235294, blue: 0.8588235294, alpha: 1)
            case .psychic:
                return #colorLiteral(red: 0.8705882353, green: 0.4705882353, blue: 0.4666666667, alpha: 1)
            case .bug:
                return #colorLiteral(red: 0.6156862745, green: 0.7490196078, blue: 0.2274509804, alpha: 1)
            case .rock:
                return #colorLiteral(red: 0.7568627451, green: 0.7176470588, blue: 0.5490196078, alpha: 1)
            case .ghost:
                return #colorLiteral(red: 0.3568627451, green: 0.4117647059, blue: 0.6666666667, alpha: 1)
            case .dragon:
                return #colorLiteral(red: 0.2470588235, green: 0.4196078431, blue: 0.7607843137, alpha: 1)
            case .dark:
                return #colorLiteral(red: 0.3450980392, green: 0.3254901961, blue: 0.4, alpha: 1)
            case .steel:
                return #colorLiteral(red: 0.4235294118, green: 0.5529411765, blue: 0.6235294118, alpha: 1)
            case .fairy:
                return #colorLiteral(red: 0.8470588235, green: 0.5803921569, blue: 0.8941176471, alpha: 1)
        }
    }

    func configureTypeIcon() -> UIImage {
        switch self {
            case .normal:
                return #imageLiteral(resourceName: "Normal")
            case .fire:
                return #imageLiteral(resourceName: "Fire")
            case .water:
                return #imageLiteral(resourceName: "Water")
            case .grass:
                return #imageLiteral(resourceName: "Grass")
            case .electric:
                return #imageLiteral(resourceName: "Electric")
            case .ice:
                return #imageLiteral(resourceName: "Ice")
            case .fighting:
                return #imageLiteral(resourceName: "Fighting")
            case .poison:
                return #imageLiteral(resourceName: "Poison")
            case .ground:
                return #imageLiteral(resourceName: "Ground")
            case .flying:
                return #imageLiteral(resourceName: "Flying")
            case .psychic:
                return #imageLiteral(resourceName: "Psychic")
            case .bug:
                return #imageLiteral(resourceName: "Bug")
            case .rock:
                return #imageLiteral(resourceName: "Rock")
            case .ghost:
                return #imageLiteral(resourceName: "Ghost")
            case .dragon:
                return #imageLiteral(resourceName: "Dragon")
            case .dark:
                return #imageLiteral(resourceName: "Dark")
            case .steel:
                return #imageLiteral(resourceName: "Steel")
            case .fairy:
                return #imageLiteral(resourceName: "Fairy")
        }
    }

    func configureTypeText() -> String {
        switch self {
            case .normal:
                return "노말"
            case .fire:
                return "불꽃"
            case .water:
                return "물"
            case .grass:
                return "풀"
            case .electric:
                return "전기"
            case .ice:
                return "얼음"
            case .fighting:
                return "격투"
            case .poison:
                return "독"
            case .ground:
                return "땅"
            case .flying:
                return "비행"
            case .psychic:
                return "에스퍼"
            case .bug:
                return "벌레"
            case .rock:
                return "바위"
            case .ghost:
                return "고스트"
            case .dragon:
                return "드래곤"
            case .dark:
                return "악"
            case .steel:
                return "강철"
            case .fairy:
                return "페어리"
        }
    }
}
