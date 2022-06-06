//
//  MyGestureView.swift
//  GestureRecognizerDemo
//
//  Created by 史导的Mac on 2021/7/29.
//

import UIKit

class MyGestureView: UIView, MyGestureDelegate {
    
    
    var shapeLayers = [CAShapeLayer]()
    var pathColor: CGColor = #colorLiteral(red: 0.8083539009, green: 0, blue: 0.2007525265, alpha: 1)
    var fadeAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        return animation
    }()
    
    func setUpView() {
        
//        self.isUserInteractionEnabled = false
        self.backgroundColor = .yellow
        guard let superV = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superV.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superV.trailingAnchor),
            self.topAnchor.constraint(equalTo: superV.topAnchor),
            self.bottomAnchor.constraint(equalTo: superV.bottomAnchor),
        ])
        let gesture = MyGestureRecognizer()
        gesture.viewDelegate = self
        self.addGestureRecognizer(gesture)
    }
    
    func startPath(with point: CGPoint) {
        shapeLayers.append(CAShapeLayer())
        shapeLayers.last!.frame = self.bounds
        self.layer.addSublayer(shapeLayers.last!)
    }
    
    func updatePath(with points: [CGPoint]) {
        DispatchQueue.main.async { [self] in
            let Bpath = UIBezierPath()
            Bpath.lineCapStyle = .square
            Bpath.lineJoinStyle = .bevel
            Bpath.move(to: points.first!)
            for n in 1..<points.count {
                Bpath.addLine(to: points[n])
            }
            shapeLayers.last?.path = Bpath.cgPath
            shapeLayers.last?.lineWidth = 5
            shapeLayers.last?.fillColor = nil
            shapeLayers.last?.strokeColor = pathColor
            shapeLayers.last?.setNeedsLayout()
        }
    }
    
    func endPath(with points: [CGPoint]) {
        let sLayer = self.shapeLayers.last!
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            sLayer.opacity = 0
            sLayer.removeFromSuperlayer()
            self.shapeLayers.removeAll(where: {$0 == sLayer})
        }
        sLayer.add(fadeAnimation, forKey: "fadeAnimation")
        CATransaction.commit()
    }
}
