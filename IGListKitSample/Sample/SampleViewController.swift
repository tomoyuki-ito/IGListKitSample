//
//  SampleViewController.swift
//  IGListKitSample
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SampleViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var adapter: ListAdapter = {
        let adaper = ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self
        )
        adaper.dataSource = self
        return adaper
    }()
    
    let colors: [String] = ["aaaaaa", "bbbbbb", "cccccc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = collectionView
    }

}

extension SampleViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return colors.enumerated().map({ SampleObject(sampleID: $0, colorCode: $1) })
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return SampleListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
