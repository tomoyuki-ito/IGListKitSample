//
//  SquareObject.swift
//  IGListKitSquare
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SquareObject: ListDiffable {

    let objectID: Int
    let colorCode: String

    init(objectID: Int, colorCode: String) {
        self.objectID = objectID
        self.colorCode = colorCode
    }

    func diffIdentifier() -> NSObjectProtocol {
        return objectID as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let o = object as? SquareObject else { return false }

        return self.colorCode == o.colorCode
    }

}

extension SquareObject: Equatable {
    
    public static func == (lhs: SquareObject, rhs: SquareObject) -> Bool {
        return lhs.objectID == rhs.objectID
    }
    
}
