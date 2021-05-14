//
//  ViewController.swift
//  food
//
//  Created by Ryley Wells on 2021-05-07.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var slider: UIPageControl!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var titleBanner: UILabel!
    
    
    var imgArr = [ UIImage(named: "prague"), UIImage(named: "paris"), UIImage(named: "Germany")]
    var nameArr = ["Prague, Czech Republic", "Paris, France", "Düsseldorf, Germany"]
    
    var timer = Timer()
    var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        titleBanner.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        slider.numberOfPages = imgArr.count
        slider.currentPage = 0
        name.text = nameArr[0]
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }

        collection.dataSource = self
        
      
    }
    
    @objc func changeImage(){
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            slider.currentPage = counter
            name.text = nameArr[counter]
            counter += 1
        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collection.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            slider.currentPage = counter
            name.text = nameArr[counter]
            counter = 1
        }
    }
    

    
}

// delegate methods of collectionview

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCollectionViewCell
        cell?.img.image = imgArr[indexPath.row]
        
        return cell!
    }
    
  
   
    
}

