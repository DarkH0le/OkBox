//
//  SectionCellCollectionViewCell.swift
//  OkBox
//
//  Created by Ivan Aldama on 23/10/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit

class SectionCell: UICollectionViewCell {
    
    
    var video : VideoModel? {
        didSet{
            titleLabel.text = video?.title
            difficulty.text = video?.difficulty
            decription.text = video?.decription
            //imageVideo.image = UIImage(data: try! Data(contentsOf: URL(string: (video?.image)!)!))
            
//            let url = URL(string: image.url)
//            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//            imageView.image = UIImage(data: data!)
            imageVideo.image = UIImage(named: (video?.image)!)
        }
    }
    
    let imageVideo : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        //image.backgroundColor = UIColor.yellow
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
//        label.text = "TITLE"
        //label.backgroundColor = UIColor.brown
        //label.text = "sddssdskmlkmlkmlkmlkmlkmlkmlkmlmlksddssdskmlkmlkmlkmlkmlkmlkmlkmlmlk"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
//        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return label
    }()
    
    let difficulty : UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = UIColor.lightGray
        label.text = "sddssdskmlkmlkmlkmlkmlkmlkmlkmlmlksddssdskmlkmlkmlkmlkmlkmlkmlkmlmlk"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        label.textContainerInset = UIEdgeInsetsMake(-2,8, 0, 0)
        label.textColor = UIColor.lightGray
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    let decription : UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = UIColor.lightGray
        label.text = "sddssdskmlkmlkmlkmlkmlkmlkmlkmlmlksddssdskmlkmlkmlkmlkmlkmlkmlkmlmlk"
        label.font = UIFont(name: "BanglaSangamMN", size: 14)
        label.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    
    let separator : UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor.black
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews(){
        //backgroundColor = UIColor.clear
        addSubview(imageVideo)
        addSubview(separator)
        addSubview(titleLabel)
        addSubview(difficulty)
        addSubview(decription)
        
        imageVideo.leftAnchor.constraint(equalTo: self.leftAnchor , constant: 8).isActive = true
        imageVideo.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        imageVideo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        imageVideo.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -32).isActive = true
        
        separator.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: imageVideo.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageVideo.rightAnchor, constant: 8).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2 , constant: -24).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: imageVideo.heightAnchor, multiplier: 1/6).isActive = true

        difficulty.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        difficulty.leftAnchor.constraint(equalTo: imageVideo.rightAnchor, constant: 8).isActive = true
        difficulty.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2 , constant: -24).isActive = true
        difficulty.heightAnchor.constraint(equalTo: imageVideo.heightAnchor, multiplier: 1/7).isActive = true
        
        decription.topAnchor.constraint(equalTo: difficulty.bottomAnchor).isActive = true
        decription.leftAnchor.constraint(equalTo: imageVideo.rightAnchor, constant: 8).isActive = true
        decription.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2 , constant: -24).isActive = true
        decription.heightAnchor.constraint(equalTo: imageVideo.heightAnchor, multiplier: 2/3).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
