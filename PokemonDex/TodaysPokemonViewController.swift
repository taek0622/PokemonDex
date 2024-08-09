//
//  TodaysPokemonViewController.swift
//  PokemonDex
//
//  Created by 김민택 on 8/9/24.
//

import UIKit

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
        $0.text = "No.1"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonName: UILabel = {
        $0.text = "이상해씨"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonGenus: UILabel = {
        $0.text = "씨앗 포켓몬"
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
        $0.backgroundColor = TypeColor.grassType
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
        $0.image = #imageLiteral(resourceName: "Grass")
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private let pokemonType1Text: UILabel = {
        $0.text = "풀"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonType2Background: UIView = {
        $0.backgroundColor = TypeColor.poisonType
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
        $0.image = #imageLiteral(resourceName: "Poison")
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    private let pokemonType2Text: UILabel = {
        $0.text = "독"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let pokemonDexDetail: UILabel = {
        $0.text = "태어났을 때부터 등에 식물의 씨앗이 있으며 조금씩 크게 자란다."
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
