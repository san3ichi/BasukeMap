//
//  PostViewController.swift
//  BasukeMap
//
//  Created by 佐々井健吾 on 2017/01/19.
//  Copyright © 2017年 kenren. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class PostViewController: UIViewController,GMSMapViewDelegate, CLLocationManagerDelegate {

    var googleMap : GMSMapView!
    
    // 取得した緯度を保持するインスタンス
    var latitude: CLLocationDegrees!
    // 取得した経度を保持するインスタンス
    var longitude: CLLocationDegrees!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latitude = CLLocationDegrees()
        longitude = CLLocationDegrees()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ズームレベル.
        let zoom: Float = 15
        
        // カメラを生成.
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: latitude,longitude: longitude, zoom: zoom)
        
        // MapViewを生成.
        googleMap = GMSMapView(frame: CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height))
        
        // MapViewにカメラを追加.
        googleMap.camera = camera
        googleMap.delegate = self
        
        // viewにMapViewを追加.
        //self.view.addSubview(googleMap)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
