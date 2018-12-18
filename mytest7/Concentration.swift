//
//  Concentration.swift
//  mytest7
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018年 李志明. All rights reserved.
//

import Foundation
class Concentraction
{
    var cards=[Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifer == cards[index].identifer{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberPairsOfCards:Int) {
        for _ in 1...numberPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
    }
}
