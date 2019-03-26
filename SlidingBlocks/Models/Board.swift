//
//  Board.swift
//  SlidingBlocks
//
//  Created by aimiliona on 2019. 03. 26..
//  Copyright © 2019. aimiliona. All rights reserved.
//

import Foundation

class Board {
    
    var map = [Block]()
    
    init(level:Int) {
        
        self.loadMap(level: level)
    }
    
    init () {}
    
    func loadMap(level:Int) {
        
    }
}
