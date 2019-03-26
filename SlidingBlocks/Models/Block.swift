//
//  Block.swift
//  SlidingBlocks
//
//  Created by aimiliona on 2019. 03. 26..
//  Copyright © 2019. aimiliona. All rights reserved.
//

import Foundation

class Block {
    
    var coordinateX: Int
    var coordinateY: Int
    var size: Int
    var vertical: Bool
    
    init(coordinateX:Int, coordinateY:Int, size:Int, vertical:Bool) {
        
        self.coordinateX = coordinateX
        self.coordinateY = coordinateY
        self.size = size
        self.vertical = vertical
    }
}
