//
//  MapViewController.swift
//  BasukeMap
//
//  Created by 佐々井健吾 on 2017/01/14.
//  Copyright © 2017年 kenren. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate{

    var gmaps : GMSMapView!
    var googleMap : GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      /*  // MapViewを生成する.
        gmaps = GMSMapView(frame: CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height))
        
        // MapViewをviewに追加する.
        self.view.addSubview(gmaps)
*/
        // 緯度.
        let lat: CLLocationDegrees = 37.508435
        
        // 経度.
        let lon: CLLocationDegrees = 139.930696
        
        // ズームレベル.
        let zoom: Float = 15
        
        // カメラを生成.
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: lat,longitude: lon, zoom: zoom)
        
        // MapViewを生成.
        googleMap = GMSMapView(frame: CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height))
        
        // MapViewにカメラを追加.
        googleMap.camera = camera
        
        // viewにMapViewを追加.
        self.view.addSubview(googleMap)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
