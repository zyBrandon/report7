//
//  Card.swift
//  mytest7
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018年 李志明. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifer:Int
    static var identfierFactory = 0
    static func getUniqueIdentifer()->Int
    {
        identfierFactory += 1
        return identfierFactory
    }
    init() {
        self.identifer = Card.getUniqueIdentifer()
    }
}
