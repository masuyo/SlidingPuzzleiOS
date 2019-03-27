//
//  BoardViewController.swift
//  SlidingBlocks
//
//  Created by aimiliona on 2019. 03. 26..
//  Copyright © 2019. aimiliona. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    private var blocks = [UIView]()
    private var numberOfBlocks = 4
    var board = Board()
    private var exitRect: UIView!
    private let unit = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let touch = UITapGestureRecognizer(target: self, action: #selector (self.tap))
//        touch.numberOfTapsRequired = 2
//        rect.addGestureRecognizer(touch)
        
        self.initExit()
        self.generateBlocks()
    }
    
    private func generateBlocks() {
//        for n in 1...numberOfBlocks {
//            let block = UIView(frame: CGRect(x: n*50, y: n*50, width: 50, height: 50))
//            block.backgroundColor = UIColor.green
//            self.view.addSubview(block)
//            let pan = UIPanGestureRecognizer(target: self, action: #selector (self.pan))
//            block.addGestureRecognizer(pan)
//            self.blocks.append(block)
//        }
        for block in self.board.map {
            
            let size = self.unit * block.size
            let width = block.vertical ? size : self.unit
            let height = block.vertical ? self.unit : size
            let rect = UIView(frame: CGRect(
                x: block.coordinateX*self.unit,
                y: block.coordinateY*self.unit,
                width: width,
                height: height))
            rect.backgroundColor = UIColor.random()
            self.view.addSubview(rect)
            let pan = UIPanGestureRecognizer(target: self, action: #selector (self.pan))
            rect.addGestureRecognizer(pan)
            self.blocks.append(rect)
        }
    }
    
    private func initExit() {
        
        self.exitRect = UIView(frame: CGRect(x: 100, y: 200, width: 50, height: 50))
        self.exitRect.backgroundColor = UIColor.red
        self.view.addSubview(exitRect)
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
}



