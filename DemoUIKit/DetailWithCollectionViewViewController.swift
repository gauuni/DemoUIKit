//
//  DetailWithCollectionViewViewController.swift
//  DemoUIKit
//
//  Created by Nguyên Nguyễn Khôi on 03/06/2024.
//

import UIKit
import SnapKit

fileprivate let cellIdentifier = "DetailCollectionViewCell"
class DetailWithCollectionViewViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = ["Lorem Ipsum is simply",
                 "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                 "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
                 "and more recently with desktop publishing software",
                 "like Aldus PageMaker including versions of Lorem Ipsum."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        
        
        
        // config layout for collectionview
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 8.0
        layout.minimumLineSpacing = 16.0
        layout.sectionInset = .zero
        collectionView.collectionViewLayout = layout
        
       
        
        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
//        self.view.addSubview(collectionView)
//
//        collectionView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
//        self.collectionView = collectionView
        
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

extension DetailWithCollectionViewViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DetailCollectionViewCell
        cell.contentView.backgroundColor = .yellow
        cell.lblTitle.text = items[indexPath.row]
        return cell
    }
    
    
}

extension DetailWithCollectionViewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension DetailWithCollectionViewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width-8)/2, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
