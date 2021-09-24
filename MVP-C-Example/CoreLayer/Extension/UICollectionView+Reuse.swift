//
//  UICollectionView+Reuse.swift
//  PharmacyPortal
//
//  Created by vlad.kosyi on 15.03.2021.
//  Copyright © 2021 com.chisw. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerReusableCellFromNib<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with indexPath: IndexPath) -> T where T: Reusable {
        return (dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T)!
    }
}
