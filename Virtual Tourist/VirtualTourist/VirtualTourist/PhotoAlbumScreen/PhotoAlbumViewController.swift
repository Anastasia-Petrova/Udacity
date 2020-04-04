//
//  PhotoAlbumViewController.swift
//  VirtualTourist
//
//  Created by Anastasia Petrova on 03/04/2020.
//  Copyright © 2020 Anastasia Petrova. All rights reserved.
//

import UIKit

class PhotoAlbumViewController: UIViewController {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: AlbumCollectionLayout())
    let dataSource = AlbumCollectionDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
        collectionView.register(MapCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MapCollectionHeader")
        collectionView.register(
            PhotosCollectionCell.self,
            forCellWithReuseIdentifier: PhotosCollectionCell.identifier
        )

        collectionView.dataSource = dataSource
        collectionView.delegate = self
        setUpCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        if let layout = collectionView.collectionViewLayout as? AlbumCollectionLayout {
            layout.setWidth(width: view.frame.width)
        }
    }
    
    private func setUpCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        collectionView.backgroundColor = .white
    }
}

extension PhotoAlbumViewController: UICollectionViewDelegate {
    
}


extension PhotoAlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
}

