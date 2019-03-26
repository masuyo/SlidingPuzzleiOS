//
//  BoardViewController.swift
//  SlidingBlocks
//
//  Created by aimiliona on 2019. 03. 26..
//  Copyright © 2019. aimiliona. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    private var rect: UIView!
    private var blocks = [UIView]()
    private var numberOfBlocks = 4
    var board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rect = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
        rect.backgroundColor = UIColor.orange
        
        self.view.addSubview(rect)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector (self.pan))
        rect.addGestureRecognizer(pan)
        
        let touch = UITapGestureRecognizer(target: self, action: #selector (self.tap))
        touch.numberOfTapsRequired = 2
        rect.addGestureRecognizer(touch)
        
        self.generateBlocks()
    }
    
    private func generateBlocks() {
        for n in 1...numberOfBlocks {
            let block = UIView(frame: CGRect(x: n*50, y: n*50, width: 50, height: 50))
            block.backgroundColor = UIColor.green
            self.view.addSubview(block)
            let pan = UIPanGestureRecognizer(target: self, action: #selector (self.pan))
            block.addGestureRecognizer(pan)
            self.blocks.append(block)
        }
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        print("double tap")
    }
    
    @objc func pan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            print("begin")
        case .ended:
            print("end")
        case .changed:
            let point = sender.location(ofTouch: 0, in: self.view)
            sender.view?.center = point
        default:
            print("hello")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
