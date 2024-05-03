//
//  TableViewDataSource.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 30/04/24.
//

import UIKit

final class TableViewDataSource<V, T>: NSObject, UITableViewDataSource where V: UITableViewCell {
    
    typealias TableViewCellConfiguration = (V, T) -> V
    
    private let models: [T]
    private let setupCell: TableViewCellConfiguration
    private let cellIdentifier: String
    
    init(models: [T], setupCell: @escaping TableViewCellConfiguration, cellIdentifier: String) {
        self.models = models
        self.setupCell = setupCell
        self.cellIdentifier = cellIdentifier
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? V
        
        guard let currentCell = cell else { return UITableViewCell() }
        
        let model = models[indexPath.row]
        
        return setupCell(currentCell, model)
    }
}
