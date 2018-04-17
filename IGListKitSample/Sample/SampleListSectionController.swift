//
//  SampleListSectionController.swift
//  IGListKitSample
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SampleListSectionController: ListSectionController {

    private var object: SampleObject?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext!.dequeueReusableCell(of: SampleCollectionViewCell.self, for: self, at: index) as? SampleCollectionViewCell else {
            fatalError()
        }
        if let colorCode = self.object?.colorCode {
            cell.contentView.backgroundColor = UIColor(hex: colorCode)
        }
        return cell
    }

    override func didUpdate(to object: Any) {
        self.object = object as? SampleObject
    }
    
}
