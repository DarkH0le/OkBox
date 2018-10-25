//
//////// NOT WOOOOORKINGGGGGGG
//
//import UIKit
//import FirebaseFirestore
//
//class FireStoreHelper {
//
//    var fstore : Firestore!
//    var videostemporal: [VideoModel] = []
//    
//    init() {
//        fstore = Firestore.firestore()
//        loadVideos()
//    }
//   
//    func getVideos() -> [VideoModel] {
//        return self.videostemporal
//    }
//
//    
//    func loadVideos() {
//        print("before firestorehelper")
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
//                    print(tempVideo.url)
//                    print(tempVideo.decription)
//                    print(tempVideo.image)
//                    print(tempVideo.title)
//                    self.videostemporal.insert(tempVideo, at: count)
//                    count = count + 1
//                    print(self.videostemporal.count)
//                }
//            }
//        }
//    }
//    
//
//}
