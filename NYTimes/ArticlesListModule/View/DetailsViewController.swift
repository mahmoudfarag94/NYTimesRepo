//
//  DetailsViewController.swift
//  NYTimes
//
//  Created by Mahmoud Farag on 3/8/22.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var article: ArticleDataShowed?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailsLabel.text = article?.abstract
        self.titleLabel.text = article?.title
    }
}
