//
//  StandardTableViewCell.swift
//  CampusWalk
//
//  Created by Terence Williams on 10/13/21.
//

import UIKit

class StandardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var theme: CardTheme = .light

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.clipsToBounds = true
        cardView.layer.borderWidth = 0.0
        cardView.layer.cornerRadius = 8
        cardView.layer.borderColor = UIColor.clear.cgColor
        
        self.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.23
        self.layer.shadowRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTheme(theme: CardTheme) {
        cardView.backgroundColor = theme == .light ? .white : .black
        titleLabel.textColor = theme == .light ? .black : .white
        subtitleLabel.textColor = theme == .light ? .black.withAlphaComponent(0.8) : .white.withAlphaComponent(0.8)
    }
    
    override func prepareForReuse() {
        cardImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
}
