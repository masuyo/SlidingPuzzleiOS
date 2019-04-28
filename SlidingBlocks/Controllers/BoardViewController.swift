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
    var board: Board?
    private var finisher: UIView?
    private var exit: UIView?
    private let unit = (Int)(UIScreen.main.bounds.width / 7)
    private let boardUnits = 6
    private let padding = 5
    private let topPadding = (Int)(UIScreen.main.bounds.height / 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.generateExit()
        self.generateBlocks()
    }
    
    private func generateBlocks() {
        
        for block in self.board!.map {
            
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
            if block === self.board!.map[0] {
                rect.backgroundColor = UIColor.black
                self.finisher = rect
            } else {
                rect.backgroundColor = UIColor.random()
            }
            self.view.addSubview(rect)
            let pan = UIPanGestureRecognizer(target: self, action: #selector (self.pan))
            rect.addGestureRecognizer(pan)
            self.blocks.append(rect)
        }
    }
    
    private func generateExit() {
        let exit = (x: self.board!.exit.coordinateX, y: self.board!.exit.coordinateY)
        print(exit.x, exit.y)
        self.exit = UIView(
            frame: CGRect(
                x: exit.x * unit + padding,
                y: exit.y * unit + padding + topPadding,
                width: unit - padding,
                height: unit - padding
        ))
        self.exit!.backgroundColor = UIColor.red
        self.view.addSubview(self.exit!)
    }
    
    @objc func pan(sender: UIPanGestureRecognizer) {
        switch sender.state {
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
            let point = sender.location(ofTouch: 0, in: self.view)
            makeLegalMove(view: tempView, point: point)
            if (!subViewIntersects(subView: sender.view!, tempView: tempView)) {
                if (withinBoundaries(view: view, tempView: tempView)) {
                    print("I should move!")
                    view.center = tempView.center
                }
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
                    print("I intersect another block")
                    viewIntersectsExit(subView: subView, view: view)
                    return true
                }
            }
        }
        print("I don't intersect a view")
        return false
    }
    
    private func viewIntersectsExit(subView: UIView, view: UIView) {
        if (subView === self.finisher && view === exit) {
            subView.removeFromSuperview()
            print("GAME OVER")
        }
    }
    
    private func withinBoundaries(view: UIView, tempView: UIView) -> Bool {
        let boundaries = (
            minX: self.padding,
            maxX: boardUnits * (self.unit + self.padding),
            minY: self.topPadding,
            maxY: boardUnits * (self.unit + self.padding) + self.topPadding
        )
        if (view === self.finisher) {
            if ((Int)(tempView.frame.minX) <= (boundaries.minX) && tempView.center.x < view.center.x ||
                (Int)(tempView.frame.minY) <= (boundaries.minY) && tempView.center.y < view.center.y ||
                (Int)(tempView.frame.maxY) >= (boundaries.maxY) && tempView.center.y > view.center.y) {
                
                print("I am a moving finisher")
                return false
            }
            return true
        }
        if ((Int)(tempView.frame.minX) <= (boundaries.minX) && tempView.center.x < view.center.x ||
            (Int)(tempView.frame.maxX) >= (boundaries.maxX) && tempView.center.x > view.center.x ||
            (Int)(tempView.frame.minY) <= (boundaries.minY) && tempView.center.y < view.center.y ||
            (Int)(tempView.frame.maxY) >= (boundaries.maxY) && tempView.center.y > view.center.y) {
            
            print("I intersect a boundary")
            return false
        }
        print("I dont intersect a boundary")
        return true
    }
    
    private func makeLegalMove(view: UIView, point: CGPoint) {
        if ((Int)(view.frame.height) < unit) {
            moveVertically(view: view, point: point)
        } else {
            moveHorizontally(view: view, point: point)
        }
    }
    
    private func moveVertically(view: UIView, point: CGPoint) {
        view.center = CGPoint(x: point.x, y: view.center.y)
    }
    
    private func moveHorizontally(view: UIView, point: CGPoint) {
        view.center = CGPoint(x: view.center.x, y: point.y)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



