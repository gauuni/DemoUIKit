//
//  DetailWithTableViewViewController.swift
//  DemoUIKit
//
//  Created by Nguyên Nguyễn Khôi on 20/05/2024.
//

import UIKit

class DetailWithTableViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailWithTableViewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        if indexPath.row % 2 == 0 {
            cell?.contentView.backgroundColor = .blue
        } else {
            cell?.contentView.backgroundColor = .white
        }
        
        cell?.textLabel?.text = "Row \(indexPath.row)"
        
        return cell!
    }
    
    
}

extension DetailWithTableViewViewController: UITableViewDelegate {
    
}

