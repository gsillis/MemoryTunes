//
//  MenuTableViewController.swift
//  MemoryGameApp
//
//  Created by Gabriela Sillis on 06/05/24.
//

import ReSwift
import UIKit

final class MenuTableViewController: UITableViewController {
    var tableViewDataSource: TableViewDataSource<UITableViewCell, String>?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        subscribe()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribe()
    }
}

private extension MenuTableViewController {
    func setupNavBar() {
        title = "Menu"
        navigationItem.hidesBackButton = true
    }
    
    func setupView() {
        view.backgroundColor = .lightGray
        tableView.register(
            MenuTitleTableViewCell.self,
            forCellReuseIdentifier: MenuTitleTableViewCell.identifier
        )
    }
    
    func subscribe() {
        store.subscribe(self) { store in
            store.select { $0.menuState }
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}

extension MenuTableViewController: StoreSubscriber {
    func newState(state: MenuState) {
        tableViewDataSource = TableViewDataSource(
            models: state.menuTitles,
            cellIdentifier: MenuTitleTableViewCell.identifier,
            setupCell: { cell, model in
                var config = cell.defaultContentConfiguration()
                config.text = model
                config.textProperties.alignment = .center
                return cell
            }
        )
        tableView.dataSource = tableViewDataSource
        tableView.reloadData()
    }
}

#Preview {
    return MenuTableViewController()
}
