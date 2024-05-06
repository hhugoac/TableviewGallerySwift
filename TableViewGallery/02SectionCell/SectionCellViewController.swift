//
//  SectionCellViewController.swift
//  TableViewGallery
//
//  Created by Hugo Alonzo on 04/05/24.
//

import UIKit

class SectionCellViewController: UIViewController {
    let rainbow: [UIColor] = [.red, .yellow, .green, .orange, .blue, .purple, .magenta]

    @IBOutlet weak var sectionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionTableView.delegate = self
        sectionTableView.dataSource = self
    }
}

extension SectionCellViewController : UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rainbow.count
}

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
    cell.backgroundColor = rainbow[indexPath.item]
    var content = cell.defaultContentConfiguration()
    content.text = rainbow[indexPath.item].accessibilityName.capitalized
    
    cell.contentConfiguration = content
    
    return cell
}
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header \(section)"
    }

}
