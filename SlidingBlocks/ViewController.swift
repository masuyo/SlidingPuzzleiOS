//
//  ViewController.swift
//  SlidingBlocks
//
//  Created by aimiliona on 2019. 03. 25..
//  Copyright © 2019. aimiliona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rect: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rect = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
        rect.backgroundColor = UIColor.orange
        
        self.view.addSubview(rect)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector (self.pan))
        rect.addGestureRecognizer(pan)
    }
    
    @objc func pan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            print("begin")
        case .ended:
            print("end")
        case .changed:
            self.rect.center = sender.location(ofTouch: 0, in: self.view)
        default:
            print("hello")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

