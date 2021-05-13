//
//  MyTableViewCell.swift
//  world
//
//  Created by Ryley Wells on 2021-05-13.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
            // register collection view cell
        return UINib(nibName: "MyTableViewCell", bundle: nil)
            
    }
    
    
    @IBOutlet weak var cellImage: UIImageView!
    
    static let identifier = "MyTableViewCell"
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image:UIImage){
        cellImage.image = image
        UIView.transition(with: cellImage, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.cellImage.image = image
        })
        }
   
    
}
