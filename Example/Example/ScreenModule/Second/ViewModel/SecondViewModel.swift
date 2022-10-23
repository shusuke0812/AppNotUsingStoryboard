//
//  SecondViewModel.swift
//  Example
//
//  Created by Shusuke Ota on 2021/5/2.
//

import UIKit

class SecondViewModel: NSObject {
    private(set) var sectionNumber = 1
    private(set) var rowNumber = 30
    
    private let baseItems: [String] = [
        "ラーメン",
        "餃子",
        "チャーハン",
        "シュウマイ",
        "唐揚げ",
    ]
    var items: [String] = []
    
    override init() {
        let count: Int = rowNumber / baseItems.count
        for _ in 0..<count {
            items.append(contentsOf: baseItems)
        }
    }
}
// MARK: - UITableView DataSource Method
extension SecondViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionNumber
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowNumber
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Common.tableViewCellIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
