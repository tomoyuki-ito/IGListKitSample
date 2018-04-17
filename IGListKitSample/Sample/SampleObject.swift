//
//  SampleObject.swift
//  IGListKitSample
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SampleObject: ListDiffable {

    let sampleID: Int
    let colorCode: String
    
    init(sampleID: Int, colorCode: String) {
        self.sampleID = sampleID
        self.colorCode = colorCode
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return sampleID as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let o = object as? SampleObject else { return false }
        
        return self.colorCode == o.colorCode
    }
    
}
