//
//  ViewController.swift
//  SwiftLearn
//
//  Created by Long Nguyen on 16/05/2024.
//

import UIKit
import SnapKit
import Kingfisher
class ViewController: UIViewController {
    var number = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "live")
        let imgView = UIImageView()
//        imgView.image = image
        imgView.image = Config.Home.Image.iconBack

//        let localURL = Bundle.main.url(forResource: "image", withExtension: "png")!
//        print(localURL)
        let url = URL(string: "https://i.ibb.co/qd8LQkC/artwork-fantasy-art-digital-art-forest-wallpaper-3cdadbae5dd4b0ca4dd008fd72d13bf3-Medium.jpg")!
//        let data = try! Data(contentsOf: url)
//        let localResourceImage = UIImage(data: data)
    
//        imgView.image = localResourceImage

//        imgView.kf.setImage(with: url)
        
//        self.view.addSubview(imgView)
//        imgView.backgroundColor = .yellow
//        imgView.contentMode = .scaleAspectFit
//        imgView.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.width.equalTo(200)
//            $0.height.equalTo(200)
//        }
    }
    
    @IBAction private func pushPressed() {
        // Init viewcontroller from storyboard
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController")
   
        // Cast type
        guard let detailVC = viewController as? DetailViewController
        else { return }
        
        // delegate
        detailVC.delegate = self
        
        // Notification
        NotificationCenter.default.addObserver(self, selector: #selector(handleNoti), name: NSNotification.Name.init(rawValue: "trigger"), object: nil)
        
        // closure
        detailVC.completionHandler = { [weak self] value in
           value
            print("completionHandler")
        }
        
        //KVO
        detailVC.addObserver(self, forKeyPath: "nameKVO", options: [.new], context: nil)
        
        // Pass parameter
        detailVC.name = "My name is Nguyen"
    
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    @objc
    func handleNoti(noti: Notification) {
        guard let info = noti.userInfo
        else{ return }
        print(info)
        print(info["name"])
    }
    
    @IBAction
    func handleNotiAction() {
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "nameKVO", let change {
//            print(change[NSKeyValueChangeKey.newKey])
//        }
 
    }
    
    
}

extension ViewController: DetailViewControllerDelegate {
    func detailViewControllerDidMove(_ viewController: DetailViewController) {
        print("detailViewControllerDidMove")
    }
    
    func detailViewController(_ viewController: DetailViewController, didSelectAt index: Int) {
        
    }
}


