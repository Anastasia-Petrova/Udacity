//
//  CollectionViewLayout.swift
//  Meme
//
//  Created by Anastasia Petrova on 24/02/2020.
//  Copyright © 2020 Anastasia Petrova. All rights reserved.
//

import UIKit

final class CollectionViewLayout: UICollectionViewFlowLayout {
    static let spacing: CGFloat = 4.0
    
    override init() {
        super.init()
        self.itemSize = .zero
        self.sectionInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
        self.minimumInteritemSpacing = Self.spacing
        self.minimumLineSpacing = Self.spacing
        self.scrollDirection = .vertical
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWidth(width: CGFloat) {
        let itemWidth = (width - Self.spacing * 2)/3.0
        self.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
}
