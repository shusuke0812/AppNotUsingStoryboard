//
//  FakeHalfModalViewModel.swift
//  Example
//
//  Created by Shusuke Ota on 2021/11/27.
//

import Foundation
import UIKit

enum MainSectionType: String {
    case select
    case edit
    
    var rows: [MainRowType] {
        switch self {
        case .select: return [.a, .b]
        case .edit: return [.c]
        }
    }
}

enum MainRowType: String {
    case a = "a"
    case b = "b"
    case c = "c"
}

class FakeHalfModalViewModel: NSObject {
    var sections: [MainSectionType] = [.select, .edit]
}

// MARK: - FakeHaldModal ViewModel
extension FakeHalfModalViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Common.tableViewCellIdentifier, for: indexPath)
        cell.textLabel?.text = sections[indexPath.section].rows[indexPath.row].rawValue
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
}
