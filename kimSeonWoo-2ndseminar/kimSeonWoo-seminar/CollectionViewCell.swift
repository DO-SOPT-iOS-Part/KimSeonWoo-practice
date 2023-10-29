//
//  CollectionViewCell.swift
//  kimSeonWoo-seminar
//
//  Created by Seonwoo Kim on 2023/10/28.
//

import UIKit
import SnapKit
import Then
protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CollectionViewCell"
    
    private let imageView = UIImageView()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [imageView,likeButton].forEach {
            contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    var itemRow: Int?
    func bindData(data: ImageCollectionData,
                      row: Int) {
            self.imageView.image = UIImage(named: data.image)
            self.likeButton.isSelected = data.isLiked
            self.itemRow = row
        }
    
    weak var delegate: ItemSelectedProtocol?

    @objc private func likeButtonTap() {
            self.likeButton.isSelected.toggle()
            if let itemRow {
                self.delegate?.getButtonState(state: self.likeButton.isSelected,
                                              row: itemRow)
            }
        }
        
        private lazy var likeButton = UIButton().then {
            $0.addTarget(self,
                         action: #selector(likeButtonTap),
                         for: .touchUpInside)
            $0.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            $0.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
        }
}

