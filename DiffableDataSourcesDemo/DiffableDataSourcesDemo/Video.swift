//
//  File.swift
//  DiffableDataSourcesDemo
//
//  Created by 张金涛 on 2022/5/30.
//

import Foundation
class Video: Hashable {
    var id=UUID()
    var title: String
    init(title:String){
        self.title = title
    }
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    static func == (lhs: Video, rhs: Video) -> Bool {
      lhs.id == rhs.id
    }
}
