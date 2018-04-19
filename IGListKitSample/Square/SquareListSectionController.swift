//
//  SquareListSectionController.swift
//  IGListKitSquare
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SquareListSectionController: ListSectionController {

    private var collection: SquareCollection?

    override init() {
        super.init()
        self.supplementaryViewSource = self
    }
    
    override func numberOfItems() -> Int {
        return collection?.objects.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext!.dequeueReusableCell(of: SquareCollectionViewCell.self, for: self, at: index) as? SquareCollectionViewCell else {
            fatalError()
        }
        if let colorCode = self.collection?.objects[index].colorCode {
            cell.contentView.backgroundColor = UIColor(hex: colorCode)
        }
        return cell
    }

    override func didUpdate(to object: Any) {
        self.collection = object as? SquareCollection
        self.inset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        self.minimumLineSpacing = 16
        self.minimumInteritemSpacing = 16
    }

}

extension SquareListSectionController: ListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let header = collectionContext!.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: self, class: SquareCollectionViewSectionHeader.self, at: index)
        header.backgroundColor = .blue
        return header
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 50)
    }
}
