//
//  CollectionViewDataSource.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 29/04/24.
//

import UIKit

final class CollectionViewDataSource<V, T>: NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
    
    typealias CollectionViewCellConfiguration = (V, T) -> V
    
    var models: [T]
    private let setupCell: CollectionViewCellConfiguration
    private let cellIdentifier: String
    
    init(models: [T], setupCell: @escaping CollectionViewCellConfiguration, cellIdentifier: String) {
        self.models = models
        self.setupCell = setupCell
        self.cellIdentifier = cellIdentifier
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? V
        
        guard let currentCell = cell else { return UICollectionViewCell() }
        
        let model = models[indexPath.row]
        
        return setupCell(currentCell, model)
    }
}
