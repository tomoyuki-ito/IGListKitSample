//
//  FirstObject.swift
//  IGListKitFirst
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class FirstObject: ListDiffable {

    let FirstID: Int
    let colorCode: String
    
    init(FirstID: Int, colorCode: String) {
        self.FirstID = FirstID
        self.colorCode = colorCode
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return FirstID as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let o = object as? FirstObject else { return false }
        
        return self.colorCode == o.colorCode
    }
    
}
