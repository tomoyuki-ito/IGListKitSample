//
//  SecondObject.swift
//  IGListKitSecond
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SecondObject: ListDiffable {

    let SecondID: Int
    let colorCode: String
    
    init(SecondID: Int, colorCode: String) {
        self.SecondID = SecondID
        self.colorCode = colorCode
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return SecondID as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let o = object as? SecondObject else { return false }
        
        return self.colorCode == o.colorCode
    }
    
}
