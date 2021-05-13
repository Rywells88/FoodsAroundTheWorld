//
//  ViewController.swift
//  food
//
//  Created by Ryley Wells on 2021-05-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carousel: UICollectionView!
    
    var imgArr = [ UIImage(named: "prague"), UIImage(named: "paris"), UIImage(named: "Germany")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        carousel.register(MyCollectionViewCell.nib(),forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        carousel.delegate = self
        carousel.dataSource = self
        
    }
    

    
}

// delegate methods of collectionview

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with:(imgArr[indexPath.row])!)
        return cell
    }
}

