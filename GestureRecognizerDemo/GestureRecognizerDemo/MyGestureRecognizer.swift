//
//  MyGestureRecognizer.swift
//  GestureRecognizerDemo
//
//

import UIKit

class MyGestureRecognizer: UIGestureRecognizer {
    
    var viewDelegate: MyGestureDelegate?
    var touchedPoints = [CGPoint]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let p = touch.location(in: view)
        
        touchedPoints.removeAll()
        touchedPoints.append(p)
        viewDelegate?.startPath(with: p)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let p = touch.location(in: view)
        
        touchedPoints.append(p)
        if touchedPoints.count > 16 { touchedPoints.removeFirst() }
        viewDelegate?.updatePath(with: touchedPoints)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let p = touch.location(in: view)
        
        touchedPoints.append(p)
        if touchedPoints.count > 16 { touchedPoints.removeFirst() }
        viewDelegate?.endPath(with: touchedPoints)
    }
}

protocol MyGestureDelegate {
//    func clearPath()
    func startPath(with point: CGPoint)
    func updatePath(with points: [CGPoint])
    func endPath(with points: [CGPoint])
}
