//
//  HomeViewController.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import UIKit

protocol HomeDisplayLogic {
    func display(viewModel: HomeModels.GetSearchList.ViewModel)
    func display(viewModel: HomeModels.TapImage.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    var interactor: HomeBusinessLogic?
    var router: HomeRoutingLogic?
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.backgroundView = HomeInitialView()
            self.collectionView.keyboardDismissMode = .onDrag
        }
    }
    
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            self.searchBar.backgroundImage = UIImage()
            self.navigationItem.searchController?.delegate = self
            self.navigationItem.searchController?.searchBar.delegate = self
        }
    }
    
    private struct Constant {
        static let extraSpacesForCell: CGFloat = 24.0
        static let cellHeight: CGFloat = 200.0
        static let emptyCellHeight: CGFloat = 300.0
        static let cellEdges: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        static let minimumLineSpacingForSection: CGFloat = 8.0
        static let minimumInteritemSpacingForSectionAt: CGFloat = 1.0
    }
    
    private var imageList: [HomeModels.Cell] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeCell.registerWithNib(to: collectionView)
        EmptyCell.registerWithNib(to: collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }
    
    func display(viewModel: HomeModels.GetSearchList.ViewModel) {
        collectionView.backgroundView = nil
        self.imageList = viewModel.cell
        collectionView.reloadData()
    }
    
    func display(viewModel: HomeModels.TapImage.ViewModel) {
        router?.routeToDetail(
            data: viewModel.selecteImageData
        )
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = imageList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: data.identifier(), for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.row == imageList.count - 1 ) {
            interactor?.handle(request: HomeModels.ScrollToBottom.Request())
        }
        
        let cells = imageList[indexPath.row]
        
        switch cells {
        case .homeCell(let data):
            guard let cell = cell as? HomeCell else { return }
            cell.willDisplay(data: data)
        case .emptyResult:
            guard let cell = cell as? EmptyCell else { return }
            cell.willDisplay()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = imageList[indexPath.row]
        
        switch data {
        case .homeCell(let data):
            interactor?.handle(request: HomeModels.TapImage.Request(selecteImageData: data))
        default:
            break
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let cells = imageList[indexPath.row]
        
        switch cells {
        case .homeCell:
            return CGSize(
                width: (collectionView.frame.width - Constant.extraSpacesForCell) / 2,
                height: Constant.cellHeight
            )
        case .emptyResult:
            return CGSize(
                width: collectionView.frame.width,
                height: Constant.emptyCellHeight
            )
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        Constant.cellEdges
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constant.minimumLineSpacingForSection
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constant.minimumInteritemSpacingForSectionAt
    }
}

extension HomeViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            imageList.removeAll()
            collectionView.reloadData()
            collectionView.backgroundView = HomeInitialView()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            return
        }
        
        collectionView.scrollToItem(
            at: IndexPath(row: 0, section: 0),
            at: .top, animated: true
        )
        
        interactor?.handle(
            request: HomeModels.GetSearchList.Request(
                keyword: keyword.replacingOccurrences(of: " ", with: "")
            )
        )
    }
}
