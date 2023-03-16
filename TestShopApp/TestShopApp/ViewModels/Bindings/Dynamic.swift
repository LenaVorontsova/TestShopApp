//
//  Dynamic.swift
//  TestShopApp
//
//  Created by Lena Vorontsova on 16.03.2023.
//

import Foundation

// Класс для биндинга вью и вьюМодели
class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
}
