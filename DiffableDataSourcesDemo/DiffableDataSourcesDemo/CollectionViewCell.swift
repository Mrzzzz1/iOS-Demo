//
//  CollectionViewCell.swift
//  DiffableDataSourcesDemo
//
//  Created by 张金涛 on 2022/5/31.
//

import Foundation
import UIKit
class collectionViewcell: UICollectionViewCell {
    var label: UILabel! = nil
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    func setUpLabel(video:Video) {
        label=UILabel()
        label.text=video.title
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive=true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive=true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive=true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
