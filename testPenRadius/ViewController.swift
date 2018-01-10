//
//  ViewController.swift
//  testPenRadius
//
//  Created by Water Lou on 2/1/2018.
//  Copyright © 2018 Water Lou. All rights reserved.
//

import UIKit

public extension CGPoint {
    /**
     * Adds (dx, dy) to the point.
     */
    public func offset(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTounches(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTounches(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTounches(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTounches(touches, with: event)
    }
    
    func handleTounches(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let event = event, let allTouches = event.allTouches else {
            return
        }
        for touch in allTouches {
            let view = getTouchInfoView(touch: touch)
            if touch.phase == .cancelled || touch.phase == .ended {
                view.touch = nil
                view.removeFromSuperview()
            }
            else {
                self.view.addSubview(view)
                view.center = touch.location(in: self.view).offset(dx: 0, dy: -70)
                // set values to the view
                view.type = touch.type
                view.majorRadius = touch.majorRadius
                view.majorRadiusTolerance = touch.majorRadiusTolerance
                view.force = touch.force
                if touch.phase == .stationary {
                    view.backgroundColor = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1.0)
                }
                else {
                    view.backgroundColor = UIColor(red: 0.8, green: 1.0, blue: 0.7, alpha: 1.0)
                }
                view.location = touch.location(in: self.view)
            }
        }
    }

    var touchInfoViews: [TouchInfoView] = []
    func getTouchInfoView(touch: UITouch) -> TouchInfoView {
        // find view for the touch
        for view in touchInfoViews {
            if let viewTouch = view.touch, viewTouch == touch {
                return view
            }
        }
        // find unused view
        for view in touchInfoViews {
            if view.superview == nil {
                view.touch = touch
                return view
            }
        }
        // create new one
        let view = TouchInfoView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.touch = touch
        view.alpha = 0.75
        view.layer.cornerRadius = 50.0
        touchInfoViews.append(view)
        return view
    }
}

