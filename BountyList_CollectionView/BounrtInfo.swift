//
//  BounrtInfo.swift
//  BountyList_CollectionView
//
//  Created by 김영서 on 2021/05/16.
//

import UIKit


struct BountyInfo{
    let name : String
    let bounty : Int
    
    var image : UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    
    init(name : String, bounty : Int) {
        self.name = name
        self.bounty = bounty
    }
}
