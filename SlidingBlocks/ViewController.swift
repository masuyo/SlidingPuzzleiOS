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
        self.loadLevels()
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
    
    private func loadLevels() {
    
        /*let levelOne = "0 2 2 false,0 1 2 false,1 3 3 false,2 4 2 true,3 4 3 false,4 0 3 true,5 0 3 true"
        let levelTwo = "1 2 2 false,1 4 2 true,2 1 3 false,3 0 2 false,3 3 3 true,4 3 2 false,5 0 3 true"
        let levelThree = "0 2 2 false,1 3 3 false,2 0 3 false,2 1 3 false,2 4 2 true,3 5 2 false,4 2 3 true"
    
        UserDefaults.standard.set(levelOne, forKey: "Level 1")
        UserDefaults.standard.set(levelTwo, forKey: "Level 2")
        UserDefaults.standard.set(levelThree, forKey: "Level 3")*/
        let string = UserDefaults.standard.object(forKey: "Level 1")
        print(string!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
