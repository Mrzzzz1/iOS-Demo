//
//  ViewController.swift
//  GestureRecognizerDemo
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let drawView = MyGestureView()
        view.addSubview(drawView)
        drawView.setUpView()
//        let gesture = MyGestureRecognizer()
//        gesture.viewDelegate = drawView
//        drawView.addGestureRecognizer(gesture)
    }
    
    
}

