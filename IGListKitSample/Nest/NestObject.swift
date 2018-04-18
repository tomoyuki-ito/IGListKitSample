//
//  NestObject.swift
//  IGListKitNest
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class NestObject: ListDiffable {

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
        guard let o = object as? NestObject else { return false }

        return self.colorCode == o.colorCode
    }

}

extension NestObject: Equatable {
    
    public static func == (lhs: NestObject, rhs: NestObject) -> Bool {
        return lhs.objectID == rhs.objectID
    }
    
}
