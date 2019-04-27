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
    var board = Board()
    private var exit: UIView!
    private let unit = (Int)(UIScreen.main.bounds.width / 7)
    private let padding = 3
    private let topPadding = (Int)(UIScreen.main.bounds.height / 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.generateExit()
        self.generateBlocks()
    }
    
    private func generateBlocks() {
        
        for block in self.board.map {
            
            let size = self.unit * block.size-padding
            let height = block.vertical ? size : self.unit-padding
            let width = block.vertical ? self.unit-padding : size
            let rect = UIView(
                frame: CGRect(
                    x: block.coordinateX * self.unit + padding,
                    y: block.coordinateY * self.unit + padding + topPadding,
                    width: width,
                    height: height
            ))
            rect.backgroundColor = UIColor.random()
            self.view.addSubview(rect)
            let pan = UIPanGestureRecognizer(target: self, action: #selector (self.pan))
            rect.addGestureRecognizer(pan)
            self.blocks.append(rect)
        }
    }
    
    private func generateExit() {
        let exit = (x: self.board.exit.coordinateX, y: self.board.exit.coordinateY)
        print(exit.x, exit.y)
        self.exit = UIView(
            frame: CGRect(
                x: exit.x * unit + padding,
                y: exit.y * unit + padding + topPadding,
                width: unit,
                height: unit
        ))
        self.exit.backgroundColor = UIColor.red
        self.view.addSubview(self.exit)
    }
    
    @objc func pan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            print("begin")
        case .ended:
            print("ended")
        case .changed:
            print("changed")
            let view = sender.view!
            let tempView = UIView(
                frame: CGRect(
                    x: view.frame.minX,
                    y: view.frame.minY,
                    width: view.frame.width,
                    height: view.frame.height
            ))
            tempView.center = sender.location(ofTouch: 0, in: self.view)
            if (!self.subViewIntersects(subView: sender.view!, tempView: tempView)) {
                let point = sender.location(ofTouch: 0, in: self.view)
                sender.view?.center = point
            }
        default:
            print("hello")
        }
    }
    
    private func subViewIntersects(subView: UIView, tempView: UIView) -> Bool {
        for view in self.view.subviews {
            if !subView.isEqual(view) {
                if tempView.frame.intersects(view.frame) {
                    print(subView === view)
                    print("im always true : )))")
                    return !viewIntersectsExit(subView: subView, view: view)
                }
            }
        }
        print("im always false")
        return false
    }
    
    private func viewIntersectsExit(subView: UIView, view: UIView) -> Bool {
        if view === exit {
            subView.removeFromSuperview()
            return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



