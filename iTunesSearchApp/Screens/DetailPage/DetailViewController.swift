//
//  DetailViewController.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 20.04.2022.
//


import UIKit
import Kingfisher

protocol DetailPageDisplayLogic {
    func display(viewModel: DetailModels.GetDetail.ViewModel)
}

class DetailViewController: UIViewController, DetailPageDisplayLogic {
    var interactor: DetailPageBusinessLogic?
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var thumbnail: UIImageView!
    @IBOutlet private weak var urlButton: UIButton!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var descContainerView: UIView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apperance()
        interactor?.handle(request: DetailModels.GetDetail.Request())
    }
    
    func display(viewModel: DetailModels.GetDetail.ViewModel) {
        titleLabel.text = viewModel.data.title
        nameLabel.text = viewModel.data.name
        thumbnail.setImage(imgUrl: viewModel.data.image ?? "")
        urlButton.setTitle(viewModel.data.url, for: .normal)
        descLabel.text = viewModel.data.longDescription
        genreLabel.text = viewModel.data.primaryGenreName
        imageContainerView.isHidden = viewModel.data.isImageAvailable
        descContainerView.isHidden = !viewModel.data.isDescAvailable
        dateLabel.text = viewModel.data.date
        countryLabel.text = viewModel.data.country
        priceLabel.text = viewModel.data.price
    }
    
    private func apperance() {
        thumbnail.style(
            style: ViewStyle(
                backgroundColor: nil,
                tintColor: nil,
                layerStyle: ViewStyle.LayerStyle(
                    masksToBounds: true,
                    cornerRadius: 4,
                    borderStyle: nil
                )
            )
        )
        titleLabel.sizeToFit()
    }
    
    @IBAction func tapBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapUrl(_ sender: UIButton) {
        guard let titleUrl = sender.titleLabel?.text else {
            return
        }
        
        if let url = URL(string: titleUrl) {
            UIApplication.shared.open(url)
        }
    }
}
