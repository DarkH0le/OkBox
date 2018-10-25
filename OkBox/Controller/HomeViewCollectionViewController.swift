//
//  HomeViewCollectionViewController.swift
//  OkBox
//
//  Created by Ivan Aldama on 23/10/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit
import FirebaseFirestore
private let reuseIdentifier = "cellId"

class HomeViewCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    let fireStorehelper = FireStoreHelper()
    
    
    var videos: [VideoModel] = {
        
    var video = VideoModel()
        video.title = "HOOK"
        video.url = "kanye_profile"
        video.image = "HOOK"
        video.decription = "A hook is a punch in boxing. It is performed by turning the core muscles and back, thereby swinging the arm, which is bent at an angle near or at 90 degrees, in a horizontal arc into the opponent."
        video.difficulty = "HARD"
        
    var video2 = VideoModel()
        video2.title = "JAB"
        video2.url = "kanye_profile"
        video2.image = "JAB"
        video2.decription = "The jab is a boxer’s most important weapon!"
        video2.difficulty = "HARD"
        
    var video3 = VideoModel()
        video3.title = "HOOK"
        video3.url = "kanye_profile"
        video3.image = "HOOK"
        video3.decription = "A hook is a punch in boxing. It is performed by turning the core muscles and back, thereby swinging the arm, which is bent at an angle near or at 90 degrees, in a horizontal arc into the opponent."
        video.difficulty = "HARD"
        
        
    var video4 = VideoModel()
        video4.title = "JAB"
        video4.url = "kanye_profile"
        video4.image = "JAB"
        video4.decription = "The jab is a boxer’s most important weapon!"
        video4.difficulty = "HARD"
        
        return [video,video2,video3,video4]
    }()
    
    var fstore : Firestore!
    //var videoModelInfor:[VideoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logScreen()
        fstore = Firestore.firestore()
        navigationItem.title = "ROUND - ONE"
        collectionView?.backgroundColor = UIColor(r: 233, g: 227, b: 230)
        // Register cell classes
        self.collectionView!.register(SectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SectionCell
        
//        var videostemporal: [VideoModel] = []
        
//        let doc = fstore.collection("videos")
//        doc.getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    var count = 0
//                    print("\(document.documentID) => \(document.data())")
//                    //print(document["url"]!)
//                    let tempVideo: VideoModel = VideoModel()
//                    tempVideo.url = document["url"]! as! String
//                    tempVideo.decription = document["decription"]! as? String
//                    tempVideo.image = document["image"]! as! String
//                    tempVideo.title = document["title"]! as! String
//
//                    print(tempVideo.url)
//                    print(tempVideo.decription)
//                    print(tempVideo.image)
//                    print(tempVideo.title)
//
////                    videostemporal.append(tempVideo , atIndex: count)
//                    videostemporal.insert(tempVideo, at: count)
//                    count = count + 1
//                    print(videostemporal.count)
//                }
//            }
//        }
       // print(fireStorehelper.getVideos().count)
            //cell.video = fireStorehelper.getVideos()[0]
        
        //var helpr :FireStoreHelper = FireStoreHelper()
        //print(helpr.getVideos())
        
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Se calcula en base a el ancho de la pantalla se consideran los pargenes y se multiplica por el aspect ration que se desea
        let heightView = ((view.frame.width - 32) * 9 / 16)
        
        
        return CGSize(width: view.frame.width, height: heightView + 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func logScreen(){
        print("logScreen")
        let logginPageView: LogginPageView = LogginPageView()
        present(logginPageView, animated: true, completion: nil)
    }
}


