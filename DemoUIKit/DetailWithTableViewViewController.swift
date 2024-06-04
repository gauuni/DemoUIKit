//
//  DetailWithTableViewViewController.swift
//  DemoUIKit
//
//  Created by Nguyên Nguyễn Khôi on 20/05/2024.
//

import UIKit

fileprivate let detailTableViewCellIdentifier = "detailTableViewCellIdentifier"
class DetailWithTableViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var items = ["Lorem Ipsum is simply",
                 "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                 "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
                 "and more recently with desktop publishing software",
                 "like Aldus PageMaker including versions of Lorem Ipsum."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: detailTableViewCellIdentifier)
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return items.count
        }
        
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: detailTableViewCellIdentifier) as! DetailTableViewCell
            
            cell.binding(text: items[indexPath.row],
                         imageURL: "https://i.ibb.co/qd8LQkC/artwork-fantasy-art-digital-art-forest-wallpaper-3cdadbae5dd4b0ca4dd008fd72d13bf3-Medium.jpg")
            cell.delegate = self
            return cell
        }
        
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        
        cell?.textLabel?.text = "Add"
        
        return cell!
    }
    
    
}

extension DetailWithTableViewViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items.append("Lorem Ipsum is simply \(items.count)")
        tableView.beginUpdates()
        let newIndexPath = IndexPath(row: items.count-1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .left)
        tableView.endUpdates()
        
//        tableView.reloadData()
    }
    

}

extension DetailWithTableViewViewController: DetailTableViewCellDelegate {
    func detailTableViewCellDidSelect(_ cell: DetailTableViewCell) {
        let indexPath = tableView.indexPath(for: cell)!
        let section = indexPath.section
        let row = indexPath.row
        print("Section \(section) Row \(row)")
        print(cell)
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController")
   
        // Cast type
        guard let detailVC = viewController as? DetailViewController
        else { return }
        
        // Pass parameter
        detailVC.name = items[row]
    
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

