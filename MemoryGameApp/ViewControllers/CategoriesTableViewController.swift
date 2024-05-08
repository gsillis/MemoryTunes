//
//  CategoriesTableViewController.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 06/05/24.
//

import ReSwift
import UIKit

final class CategoriesTableViewController: UITableViewController {

    var tableViewDataSource: TableViewDataSource<UITableViewCell, Category>?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribe()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribe()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        store.dispatch(ChangeCategoryAction(categoryIndex: indexPath.row))
    }
}

private extension CategoriesTableViewController {
    func setupView() {
        view.backgroundColor = .systemMint
        title = "Categories"
        
        tableView.register(
            MenuTitleTableViewCell.self,
            forCellReuseIdentifier: MenuTitleTableViewCell.identifier
        )
    }
    
    func subscribe() {
        store.subscribe(self) { store in
            store.select { $0.categoriesState }
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
    
    func setupTableViewCell(with state: CategoriesState) {
        tableViewDataSource = TableViewDataSource(
            models: state.categories,
            cellIdentifier: MenuTitleTableViewCell.identifier,
            setupCell: { cell, model in
                var content = cell.defaultContentConfiguration()
                content.text = model.rawValue
                content.textProperties.alignment = .center
                cell.contentConfiguration = content
                return cell
            }
        )
        tableView.dataSource = tableViewDataSource
        tableView.reloadData()
    }
}

extension CategoriesTableViewController : StoreSubscriber {
    func newState(state: CategoriesState) {
        setupTableViewCell(with: state)
    }
}
