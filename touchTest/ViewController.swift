//
//  ViewController.swift
//  touchTest
//
//  Created by 陳仲堯 on 2018/10/3.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit
import YNDropDownMenu

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectViewLayout:
    UICollectionViewFlowLayout!
    let sceneList = ["fiveleaves.jpg", "forkeerestaurant.jpg", "grahamavenuemeats.jpg", "haighschocolate.jpg", "homei.jpg"]
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    @IBAction func Test(_ sender: UITapGestureRecognizer) {
        print("touch")
        UIView.animate(withDuration: 0.2, animations: {
            () -> Void in
            self.image.transform = CGAffineTransform(scaleX: 2, y: 2)
        })
//        image.animationDuration = 0.2
//        image.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let frame = CGRect(x: 0, y: 30, width: 100, height: 10)
//        let uiView = UIView(frame: CGRect(x: 0, y: 30, width: 100, height: 100))
////        // Do any additional setup after loading the view, typically from a nib.
//        
//        let view = YNDropDownMenu(frame: frame, dropDownViews: [uiView], dropDownViewTitles: ["TEST"])
//        self.view.addSubview(view)
        
        collectViewLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 20)
        collectViewLayout.itemSize = CGSize(width: fullScreenSize.width / 2 - 20, height: 200)
        collectViewLayout.minimumLineSpacing = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sceneList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.imageView.image = UIImage(named: sceneList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(sceneList[indexPath.row])
    }
}

