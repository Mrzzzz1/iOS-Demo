//
//  ViewController.swift
//  UIPickViewDemo
//
//  Created by 张金涛 on 2022/5/23.
//

import UIKit

class ViewController: UIViewController {
    let picker=UIPickerView()
    let button=UIButton()
    var pickHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPickView()
        setUpButton()
    }
    func setUpPickView(){
        //picker.frame=CGRect(x: 200, y: 200, width: 50, height: 50)
        //picker.frame=CGRect(x: 50, y: 50, width: 50, height: 50)
        view.addSubview(picker)
        picker.translatesAutoresizingMaskIntoConstraints=false
        picker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive=true
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        pickHeight=picker.heightAnchor.constraint(equalToConstant: 100)
        pickHeight.isActive=true
        picker.widthAnchor.constraint(equalToConstant: 100).isActive=true
        picker.delegate=self
        picker.dataSource=self
        picker.selectRow(3, inComponent: 0, animated: true)
        //picker.backgroundColor = .blue
        
    }
    func setUpButton(){
        view.addSubview(button)
        button.frame=CGRect(x: 100, y: 50, width: 100, height: 50)
        button.setTitle("点", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    @objc func click(){
        pickHeight.isActive=false
        pickHeight = picker.heightAnchor.constraint(equalToConstant: 600)
        pickHeight.isActive=true
        //view.layoutIfNeeded()
    }

}
extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label=UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 100))
        label.text="\(row)"
        label.font=UIFont.boldSystemFont(ofSize: 50)
        return label
    }
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let title=NSMutableAttributedString(string: "\(row)")
//        return title
//    }
    
    
}

