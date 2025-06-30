//
//  Observable.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 30/06/25.
//

import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    private var listener: ((T?) -> Void)?
    
    init(value: T? = nil) {
        self.value = value
    }
    
    func bind(listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
