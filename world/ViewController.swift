//
//  ViewController.swift
//  food
//
//  Created by Ryley Wells on 2021-05-07.
//

import UIKit

class ViewController: UIViewController {
   

    
    @IBOutlet weak var tableView: UITableView!
    
    var imgArr = [ UIImage(named: "prague"), UIImage(named: "paris"), UIImage(named: "Germany")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    
        tableView.dataSource = self
        
    }
    

    
}

// delegate methods of collectionview

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with:(imgArr[indexPath.row])!)
        return cell
    }
    
}

