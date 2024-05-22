//
//  DetailViewController.swift
//  DemoUIKit
//
//  Created by Nguyên Nguyễn Khôi on 20/05/2024.
//

import UIKit
import SnapKit

protocol DetailViewControllerDelegate {
    func detailViewControllerDidMove(_ viewController: DetailViewController)
    func detailViewController(_ viewController: DetailViewController, didSelectAt index: Int)
}

class DetailViewController: UIViewController {

    var name: String?
    var delegate: DetailViewControllerDelegate?
    
    @objc dynamic var nameKVO: String?
    
    var completionHandler: ((Int) -> ())?
    
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = name
        
    }
    

    @IBAction private func triggerWithDelegatePressed() {
        delegate?.detailViewControllerDidMove(self)
    }
    
    @IBAction private func triggerWithClosurePressed() {
        completionHandler?(1)
    }
    
    @IBAction private func triggerWithNotificationPressed() {
        let dict = ["name": "nguyen"]
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "trigger"), object: nil, userInfo: dict)
    }
    
    @IBAction private func triggerWithKVOPressed() {
        nameKVO = "This has change"
    }
}
