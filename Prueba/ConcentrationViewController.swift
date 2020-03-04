//
//  ViewController.swift
//  Prueba
//
//  Created by Diego Dominguez on 08/01/2020.
//  Copyright © 2020 Diego Dominguez. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)//lazy: it innits when someone picks it
    
    
        var numberOfPairsOfCards: Int{
            return(cardButtons.count+1)/2
    }
    
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var theme: String?{
        didSet{
            emojiChoices = theme ?? ""
            emoji = [:]//reset the dictionary
            updateView()
        }
    }
    private var emojiChoices = "😈❤️⭐️👻💡😡"
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLable: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }

    
    private(set) var flipCount: Int = 0{
        didSet{
            updateFlipCountLabel()
        }
    } //int me lo podria ahorrar
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        ]
        let attributedString = NSAttributedString(string: "Flips : \(flipCount)", attributes: attributes)
        flipCountLable.attributedText = attributedString
    }
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateView()
        }else{
            print("chosen card not in cardButtons")
        }
        
        
    }
    
    func updateView(){
        if cardButtons != nil {
            for index in cardButtons.indices{
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp{
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0):#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                }
            }
        }
    }
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card)->String{
        
        if emoji[card] == nil,emojiChoices.count > 0{
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
            
        }
        return emoji[card] ?? "?"
}

}

extension Int{
    var arc4random: Int {
        if self > 0{
             return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0{
             return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0;
        }
        
    }
}
