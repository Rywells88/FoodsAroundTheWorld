//
//  MyCollectionViewCell.swift
//  world
//
//  Created by Ryley Wells on 2021-05-12.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image:UIImage){
            imageView.image = image
        UIView.transition(with: imageView, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.imageView.image = image
        })
        }
    static func nib() -> UINib {
            // register collection view cell
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
            
    }

}
