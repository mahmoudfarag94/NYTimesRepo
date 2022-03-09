//
//  MainArticlesCell.swift
//  NYTimes
//
//  Created by Mahmoud Farag on 3/8/22.
//

import UIKit

class MainArticlesCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var articleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureUi(article: ArticleDataShowed) {
        titleLable.text = article.title
        let articlee = article.abstract
        let nsString = articlee as NSString
        if nsString.length >= 10
                {
                 // making description of only 20 characters with (click to continue) sentence
                    let customLength = "\(nsString.substring(with: NSRange(location: 0, length: nsString.length > 20 ? 20 : nsString.length)))"
                    let continueTxt = "... click to continue"
                    articleLable.text = customLength + continueTxt
            }
    }
    
}


