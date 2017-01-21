//
//  MapPostViewController.swift
//  BasukeMap
//
//  Created by 佐々井健吾 on 2017/01/14.
//  Copyright © 2017年 kenren. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapPostViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    var googleMap : GMSMapView!
    
    var myLocationManager: CLLocationManager!
    
    // 取得した緯度を保持するインスタンス
    var latitude: CLLocationDegrees!
    // 取得した経度を保持するインスタンス
    var longitude: CLLocationDegrees!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // フィールドの初期化
        myLocationManager = CLLocationManager()
        latitude = CLLocationDegrees()
        longitude = CLLocationDegrees()
        
        
        // CLLocationManagerをDelegateに指定
        myLocationManager.delegate = self
        
        // 位置情報取得の許可を求めるメッセージの表示．必須．
        myLocationManager.requestAlwaysAuthorization()
        
        
        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        print("authorizationStatus:\(status.rawValue)");
        
        // まだ認証が得られていない場合は、認証ダイアログを表示
        // (このAppの使用中のみ許可の設定) 説明を共通の項目を参照
        if(status == .notDetermined) {
            self.myLocationManager.requestWhenInUseAuthorization()
        }
        
        
        // 位置情報の精度を指定．任意，
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 位置情報取得間隔を指定．指定した値（メートル）移動したら位置情報を更新する．任意．
        myLocationManager.distanceFilter = 100
        
        // GPSの使用を開始する
        myLocationManager.startUpdatingLocation()
        
        
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
        
        googleMap.isMyLocationEnabled = true
        
        googleMap.settings.myLocationButton = true
        
        googleMap.delegate = self
        
        // viewにMapViewを追加.
        self.view.addSubview(googleMap)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*   /*認証に変化があった際に呼ばれる*/
     private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
     
     print("didChangeAuthorizationStatus");
     
     // 認証のステータスをログで表示.
     var statusStr: String = "";
     
     switch (status) {
     case .notDetermined:
     statusStr = "未認証の状態"
     case .restricted:
     statusStr = "制限された状態"
     case .denied:
     statusStr = "許可しない"
     case .authorizedAlways:
     statusStr = "常に使用を許可"
     case .authorizedWhenInUse:
     statusStr = "このAppの使用中のみ許可"
     }
     print(" CLAuthorizationStatus: \(statusStr)")
     }
     */
    
    /*位置情報取得に成功したときに呼び出されるデリゲート*/
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last
        // 取得した緯度がnewLocation.coordinate.longitudeに格納されている
        latitude = newLocation!.coordinate.latitude
        // 取得した経度がnewLocation.coordinate.longitudeに格納されている
        longitude = newLocation!.coordinate.longitude
        
        // 取得した緯度・経度をLogに表示
        NSLog("latiitude: \(latitude) , longitude: \(longitude)")
        
        // GPSの使用を停止する．停止しない限りGPSは実行され，指定間隔で更新され続ける．
        // lm.stopUpdatingLocation()
        
        googleMap.animate(toLocation: CLLocationCoordinate2DMake(latitude, longitude))
    }
    
    /*位置情報取得失敗時に実行される関数*/
    func locationManager(_ manager: CLLocationManager,didFailWithError error: Error){
        print("error")
    }
    
    /*長押しでピンを刺す関数*/
     func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        mapView.clear()
        
        let marker = GMSMarker(position: coordinate)

        marker.opacity = 0.6
        marker.title = "Current Location"
        marker.snippet = ""
        marker.map = mapView
        
        print("\(coordinate.latitude),\(coordinate.longitude)")
        
        let postViewController = self.storyboard?.instantiateViewController(withIdentifier: "PostView") as! PostViewController
        postViewController.latitude = coordinate.latitude
        postViewController.longitude = coordinate.longitude
        self.present(postViewController, animated: true, completion: nil)

        
    }

    
/*    /*マーカーの情報ウィンドウがタップされた後に呼び出されます。*/
    func mapView(mapView: GMSMapView!,didTapInfoWindowOfMarker marker: GMSMarker!){
        let postViewController = self.storyboard?.instantiateViewController(withIdentifier: "PostView") as! PostViewController
        //     postViewController.latitude = coordinate.latitude
        //     postViewController.longitude = coordinate.longitude
        self.present(postViewController, animated: true, completion: nil)
        
    }
*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
