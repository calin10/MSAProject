//
//  levelFactory.swift
//  SpellingBee
//
//  Created by Rodina, Calin on 30/12/2016.
//  Copyright © 2016 Rodina, Calin. All rights reserved.
//

import UIKit

class levelFactory: NSObject {

    
    static let lettersList = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
                       "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    static let wordsList = ["chicken", "cow", "dog", "dolphin", "fox", "groot", "hippo", "mammoth", "minion", "pig", "puppy", "rhino", "zebra",
                     "banana", "candy", "chips" ,"chocolate" ,"cookie","eggs","grapes","lemon","lettuce","meat","milk","orange",
                     "pasta","peach","pear","potato","soup","tomato","cricket","firefly","fly","moth","spider"]
    
    
    static func getBonusLevel() -> [String] {
       
        var availableWordsList : [String] = []
        var index = 0
        var letter : String = ""
        
        while(availableWordsList.count == 0){
            index = Int(arc4random_uniform(UInt32(lettersList.count-1)))
            letter = lettersList[index]
            
            availableWordsList = wordsList.filter({$0.characters.first == letter.characters.first})
        }
        
        let index1 = Int(arc4random_uniform(UInt32(availableWordsList.count-1)))
        let goodWord = availableWordsList[index1]
        
        var wordCount = 2
        var extraWords : [String] = []
        
        while(wordCount > 0) {
            let option = wordsList[Int(arc4random_uniform(UInt32(lettersList.count-1)))]
            if !availableWordsList.contains(option) && !extraWords.contains(option) {
                extraWords.append(option)
                wordCount -= 1
            }
        }
        
        return [letter, goodWord, extraWords[0], extraWords[1]]
    }
    
    static func getInsectLevel() -> [Level] {
        var levels : [Level] = []
        let tempArray = [LevelSnail(),
                         LevelSpider(),
                         LevelBee(),
                         LevelLadybug(),
                         LevelAnt(),
                         LevelScarab(),
                         LevelMantis()
                        ]
        var randomIndex = Int(arc4random_uniform(UInt32(tempArray.count-1)))
        for _ in 0 ... tempArray.count-1 {
            levels.append(tempArray[randomIndex % tempArray.count])
            randomIndex += 1
        }
        
        return  levels
    }
    
    static  func getAnimalLevel() -> [Level] {
        var levels : [Level] = []
        let tempArray = [LevelBear(),
                         LevelBunny(),
                         LevelCat(),
                         LevelGiraffe(),
                         LevelLion(),
                         LevelPenguin(),
                         LevelHorse()
                        ]
        var randomIndex = Int(arc4random_uniform(UInt32(tempArray.count-1)))
        for _ in 0 ... tempArray.count-1 {
            levels.append(tempArray[randomIndex % tempArray.count])
            randomIndex += 1
        }
        
        return  levels

    }
    
     static func getFoodLevel() -> [Level] {
        var levels : [Level] = []
        let tempArray = [LevelBurger(),
                         LevelFries(),
                         LevelApple(),
                         LevelCheese(),
                         LevelSausage(),
                         LevelPizza(),
                         LevelSalami()
                        ]
        var randomIndex = Int(arc4random_uniform(UInt32(tempArray.count-1)))
        for _ in 0 ... tempArray.count-1 {
            levels.append(tempArray[randomIndex % tempArray.count])
            randomIndex += 1
        }
        
        return  levels

        
    }
    
    
}
