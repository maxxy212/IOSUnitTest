//
//  Box.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
