//
//  UITableView+Reuse.swift.swift
//  PharmacyPortal
//
//  Created by vlad.kosyi on 13.11.2020.
//  Copyright © 2020 com.chisw. All rights reserved.
//

import UIKit

protocol Configurable: class {
    static var rowHeight: CGFloat { get }
}

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UITableView {
    
    func registerReusableCellFromNib<T: UITableViewCell>(_: T.Type) where T: Reusable {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with indexPath: IndexPath) -> T where T: Reusable {
        return (dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T)!
    }
}
