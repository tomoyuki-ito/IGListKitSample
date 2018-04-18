//
//  NestListSectionController.swift
//  IGListKitNest
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class NestListSectionController: ListSectionController {

    private var collection: NestCollection?

    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    
    override func numberOfItems() -> Int {
        return collection?.objects.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 100)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext!.dequeueReusableCell(of: NestCollectionViewCell.self, for: self, at: index) as? NestCollectionViewCell else {
            fatalError()
        }
        if let colorCode = self.collection?.objects[index].colorCode {
            cell.contentView.backgroundColor = UIColor(hex: colorCode)
        }
        return cell
    }

    override func didUpdate(to object: Any) {
        self.collection = object as? NestCollection
    }

}

extension NestListSectionController: ListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let header = collectionContext!.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, class: NestCollectionViewSectionHeader.self, at: index)
        header.backgroundColor = .blue
        return header
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 50)
    }
}
