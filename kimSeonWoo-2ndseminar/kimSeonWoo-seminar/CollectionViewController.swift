//
//  CollectionViewController.swift
//  kimSeonWoo-seminar
//
//  Created by Seonwoo Kim on 2023/10/28.
//

import UIKit
import Then
import SnapKit

class CollectionViewController: UIViewController {
  
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setCollectionViewLayout()
        setCollectionViewConfig()
        
        // Do any additional setup after loading the view.
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    private func setCollectionViewConfig() {
        self.collectionView.register(CollectionViewCell.self,
                                     forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
            flowLayout.minimumLineSpacing = 3
            flowLayout.minimumInteritemSpacing = 3
            self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
        }
    
}

extension CollectionViewController: UICollectionViewDelegate {}
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                            for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        item.delegate = self
        item.bindData(data: imageCollectionList[indexPath.row], row: indexPath.row )
        return item
    }
}


extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
    }
}

extension CollectionViewController: ItemSelectedProtocol {
    func getButtonState(state: Bool, row: Int) {
        imageCollectionList[row].isLiked = state
    }
    
    
}
