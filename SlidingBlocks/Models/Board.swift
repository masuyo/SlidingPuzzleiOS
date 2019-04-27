//
//  Board.swift
//  SlidingBlocks
//
//  Created by aimiliona on 2019. 03. 26..
//  Copyright © 2019. aimiliona. All rights reserved.
//

import Foundation

class Board {
    
    private(set) var map = [Block]()
    private(set) var exit = Block(coordinateX: 6, coordinateY: 2, size: 1, vertical: false)
    
    init(level:Int) {
        self.loadMap(level: level)
    }
    
    init () {}
    
    func loadMap(level:Int) {
        
        let levelKey = "Level " + String(level)
        print(levelKey)

        let levelString: String = UserDefaults.standard.object(forKey: levelKey) as! String
        let blocksString: [String] = self.splitIntoBlocks(levelString: levelString)
        for blockString in blocksString {
            let block: Block = self.splitIntoBlock(blockString: blockString)
            self.map.append(block)
        }
    }
    
    private func splitIntoBlocks(levelString: String) -> [String] {
        let splitLevelString: [String]  = levelString.components(separatedBy: ",")
        return splitLevelString
    }
    
    private func splitIntoBlock(blockString: String) -> Block {
        var blockSplit: [String] = blockString.components(separatedBy: " ")
        let block: Block = Block(
            coordinateX: Int(blockSplit[0])!,
            coordinateY: Int(blockSplit[1])!,
            size: Int(blockSplit[2])!,
            vertical: Bool(blockSplit[3])!
        )
        print(blockSplit)
        return block
    }
}
