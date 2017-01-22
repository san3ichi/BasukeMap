//
//  PostData.swift
//  BasukeMap
//
//  Created by 佐々井健吾 on 2017/01/23.
//  Copyright © 2017年 kenren. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import CoreLocation


 let postData = ["latitude": latitudeLabel.text!, "longitude": longitudeLabel.text!, "placename": placenameText.text!, "ringnumber": ringnumberText.text!, "details": detailsTextView.text!, "time": String(time), "name": name!]


class PostData: NSObject {
    var id: String?
    var latitude: CLLocationDegrees!    // 取得した緯度を保持するインスタンス
    var longitude: CLLocationDegrees!   // 取得した経度を保持するインスタンス
    var placename: String?
    var ringnumber: String?
    var details: String?
    var date: NSDate?
    var name: String?
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        self.latitude = valueDictionary["latitude"] as? CLLocationDegrees
        
        self.longitude = valueDictionary["longitude"] as? CLLocationDegrees
        
        self.placename = valueDictionary["placename"] as? String
        
        self.ringnumber = valueDictionary["ringnumber"] as? String
        
        self.details = valueDictionary["details"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        self.name = valueDictionary["name"] as? String
        
    }

}
