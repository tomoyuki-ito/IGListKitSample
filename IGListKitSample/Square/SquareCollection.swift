//
//  SquareCollection.swift
//  IGListKitSample
//
//  Created by Tomoyuki Ito on 2018/04/18.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SquareCollection: ListDiffable {
    
    let collectionID: Int
    let objects: [SquareObject]
    
    init(collectionID: Int, objects: [SquareObject]) {
        self.collectionID = collectionID
        self.objects = objects
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return collectionID as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let o = object as? SquareCollection else { return false }
        
        return self.objects == o.objects
    }
    
}
