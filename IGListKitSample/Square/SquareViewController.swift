//
//  SquareViewController.swift
//  IGListKitSquare
//
//  Created by Tomoyuki Ito on 2018/04/17.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import IGListKit

class SquareViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    lazy var adapter: ListAdapter = {
        let adaper = ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self
        )
        adaper.dataSource = self
        return adaper
    }()

    let colors: [String] = ["aaaaaa", "bbbbbb", "cccccc", "dddddd","aaaaaa", "bbbbbb", "cccccc", "dddddd"]

    override func viewDidLoad() {
        super.viewDidLoad()

        adapter.collectionView = collectionView
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionHeadersPinToVisibleBounds = true
    }

}

extension SquareViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            SquareCollection(
            collectionID: 0,
            objects: colors.enumerated().map({ SquareObject(objectID: $0, colorCode: $1) }))
        ]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return SquareListSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
