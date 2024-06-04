//
//  DetailTableViewCell.swift
//  DemoUIKit
//
//  Created by Nguyên Nguyễn Khôi on 27/05/2024.
//

import UIKit
import Kingfisher

protocol DetailTableViewCellDelegate {
    func detailTableViewCellDidSelect(_ cell: DetailTableViewCell)
}

class DetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var button: UIButton!
    
    var delegate: DetailTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func binding(text: String?, imageURL: String?) {
        if let imageURL = imageURL, let url = URL(string: imageURL) {
            imgView.kf.setImage(with: url)
        }
        
        
        lblTitle.text = text
    }
    
    @IBAction private func btnPressed() {
        delegate?.detailTableViewCellDidSelect(self)
    }
    
}
