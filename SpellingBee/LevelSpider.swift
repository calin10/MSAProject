//
//  LevelSpider.swift
//  SpellingBee
//
//  Created by Rodina, Calin on 28/12/2016.
//  Copyright © 2016 Rodina, Calin. All rights reserved.
//

import Foundation
import UIKit

class LevelSpider : InsectLevel {
    
    override init() {
        super.init()
        imageView = UIImage(named: "rock")
        completeWord   = ["s","p","i","d","e", "r"]
        incompleteWord = ["s","_","_","d","_", "r"]
        options        = ["a", "s", "r", "t", "d", "n" , "a", "e", "i", "h", "l", "p"]
        

    }
    
    override func isLevelComplete() -> Bool {
        for index in 0 ... completeWord.count-1 {
            if incompleteWord[index] != completeWord[index]{
                return false
            }
        }
        return true
    }
}
