//
//  ViewController.swift
//  DiffableDataSourcesDemo
//
//  Created by 张金涛 on 2022/5/30.
//

import UIKit

class ViewController: UIViewController {
    enum Section {
        case main
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section,Video>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, Video>!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        makeDataSource()
        applySnapshot()
        // Do any additional setup after loading the view.
    }
    
    func setUpCollectionView() {
        let layout=UICollectionViewFlowLayout()
        layout.itemSize=CGSize(width: view.frame.width, height: 100)
        collectionView=UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(collectionViewcell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.delegate=self
        view.addSubview(collectionView)
    }
    func makeDataSource() {
        dataSource=UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView,indexPath, video) -> UICollectionViewCell? in
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! collectionViewcell
            cell.setUpLabel(video: video)
            return cell
        })
    }
    func applySnapshot(animatingDifferences: Bool = true) {
      snapshot = NSDiffableDataSourceSnapshot<Section , Video>()
      snapshot.appendSections([.main])
        let videos:[Video] = [Video(title: "1"), Video(title: "2"), Video(title: "3")]
        snapshot.appendItems(videos, toSection: .main)
      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    @objc func updateCollectionView(){
        let videos:[Video] = [Video(title: "4"), Video(title: "5"), Video(title: "6")]
        var snapshot = NSDiffableDataSourceSnapshot<Section , Video>()
            snapshot.appendSections([.main])
            snapshot.appendItems(videos, toSection: .main)
            dataSource.apply(snapshot, animatingDifferences: true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("toutchesEnd")
        updateCollectionView()
    }
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
        guard let video = dataSource.itemIdentifier(for: indexPath) else {
          return
        }
        print(video.title,video.hashValue)
        updateCollectionView()
    }
}
