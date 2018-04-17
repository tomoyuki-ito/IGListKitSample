//
//  SecondListSectionController.swift
//  IGListKitSecond
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SecondListSectionController: ListSectionController {

    private var object: SecondObject?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 150)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext!.dequeueReusableCell(of: SecondCollectionViewCell.self, for: self, at: index) as? SecondCollectionViewCell else {
            fatalError()
        }
        if let colorCode = self.object?.colorCode {
            cell.contentView.backgroundColor = UIColor(hex: colorCode)
        }
        return cell
    }

    override func didUpdate(to object: Any) {
        self.object = object as? SecondObject
    }
    
}
