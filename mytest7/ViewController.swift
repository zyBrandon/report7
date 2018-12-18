//
//  ViewController.swift
//  mytest7
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018年 李志明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentraction(numberPairsOfCards:
        (cardButtons.count+1)/2)
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var filpCountLable: UILabel!
    
    var flipCount=0
    {
        didSet
        {
            filpCountLable.text="Flips: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber=cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else
        {
            print("there is no card")
        }
        
    }
    func updateViewFromModel() {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp
            {
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            }else
            {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9610558152, green: 0.5509537458, blue: 0.01276976243, alpha: 0):#colorLiteral(red: 0.9610558152, green: 0.5509537458, blue: 0.01276976243, alpha: 1)
            }
            
        }
    }
    var emojiChoices = ["🎃","👻","🧙‍♀️","🐳","😈","👹","🤖","🐹","🍣","🍜","🍤","🍡","🍱","🎂","🍨","🍜"]
    var emoji = [Int:String]()
    func emoji(for card:Card)->String
    {
        if emoji[card.identifer]==nil,emojiChoices.count>0
        {
            let randomInex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifer]=emojiChoices.remove(at: randomInex)
        }
        return emoji[card.identifer] ?? "?"
    }
    
    func flipCard(withEmoji emoji:String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9610558152, green: 0.5509537458, blue: 0.01276976243, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    @IBAction func palyAgain(_ sender: UIButton) {
        game = Concentraction(numberPairsOfCards: (cardButtons.count+1)/2)
        updateViewFromModel()
        flipCount=0
    }
    
}

