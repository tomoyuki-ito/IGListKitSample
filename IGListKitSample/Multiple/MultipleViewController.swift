//
//  MultipleViewController.swift
//  IGListKitMultiple
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class MultipleViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter: ListAdapter = {
        let adaper = ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self
        )
        adaper.dataSource = self
        return adaper
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = collectionView
    }

}

extension MultipleViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            FirstObject(FirstID: 0, colorCode: "aaaaaa"),
            SecondObject(SecondID: 1, colorCode: "bbbbbb"),
            FirstObject(FirstID: 2, colorCode: "aaaaaa"),
            SecondObject(SecondID: 3, colorCode: "bbbbbb"),
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is FirstObject:
            return FirstListSectionController()
        case is SecondObject:
            return SecondListSectionController()
        default:
            fatalError()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
