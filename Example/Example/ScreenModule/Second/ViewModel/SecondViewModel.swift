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
        cell.textLabel?.text = "test"
        return cell
    }
}
