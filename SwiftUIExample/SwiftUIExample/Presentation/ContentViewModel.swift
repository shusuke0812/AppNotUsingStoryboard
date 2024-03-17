//
//  ContentViewModel.swift
//  SwiftUIExample
//
//  Created by Shusuke Ota on 2024/3/17.
//

import Foundation

class ContentViewModel {
    @UserDefault(key: "TAPPED", defaultValue: false)
    var isTapped: Bool
}
