//
//  Card.swift
//  DeckOfOneCard35
//
//  Created by Todd Crandall on 8/4/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import Foundation

struct Card: Decodable {
    
    var value: String
    var suit: String
    var image: URL
}

struct TopLevelObject: Decodable {
    
    var cards: [Card]
    
}
