//
//  ViewController.swift
//  SlidingBlocks
//
//  Created by aimiliona on 2019. 03. 25..
//  Copyright © 2019. aimiliona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func openLevel(_ sender: Any) {
        
        let button: UIButton = sender as! UIButton
        var level = 1
        
        switch button.titleLabel?.text {
        case "Level 1":
            print("Level 1")
        case "Level 2":
            level = 2
            print("Level 2")
        case "Level 3":
            level = 3
            print("Level 3")
        default:
            print("A button was pressed.")            
        }
        
        self.loadBoard(level: level)
        performSegue(withIdentifier: "LevelSegue", sender: self)
    }
    
    private func loadBoard(level: Int) {
        
        self.board = Board(level: level)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "LevelSegue") {
            let boardView = segue.destination as! BoardViewController
            boardView.board = self.board
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

