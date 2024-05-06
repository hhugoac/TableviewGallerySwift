//
//  SimpleCellViewController.swift
//  TableViewGallery
//
//  Created by Hugo Alonzo on 04/05/24.
//

import UIKit

class SimpleCellViewController: UIViewController {

    @IBOutlet weak var simpleTableView: UITableView!
    
    let rainbow: [UIColor] = [.red, .yellow, .green, .orange, .blue, .purple, .magenta]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleTableView.delegate = self
        simpleTableView.dataSource = self
        simpleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "colorCell")
    }
}

extension SimpleCellViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rainbow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.backgroundColor = rainbow[indexPath.item]
        
        var content = cell.defaultContentConfiguration()
        content.text = rainbow[indexPath.item].accessibilityName.capitalized
        
        cell.contentConfiguration = content
        
        return cell
    }
}
