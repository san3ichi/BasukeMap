//
//  PostViewController.swift
//  BasukeMap
//
//  Created by 佐々井健吾 on 2017/01/19.
//  Copyright © 2017年 kenren. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleMaps
import CoreLocation
import ESTabBarController

class PostViewController: UIViewController,GMSMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var placenameText: UITextField!
    @IBOutlet weak var ringnumberText: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    
    @IBAction func postButton(_ sender: Any) {
        
        // ログインしていなければログインの画面を表示する
        if FIRAuth.auth()?.currentUser == nil {
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            self.present(loginViewController!, animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func unwindButton(_ sender: Any) {
        let mapPostViewController = self.storyboard?.instantiateViewController(withIdentifier: "MapPost") as! MapPostViewController

        self.present(mapPostViewController, animated: true, completion: nil)
        
        
        let tabBarController = parent as! ESTabBarController
        tabBarController.setSelectedIndex(2, animated: false)
    }
    
    var googleMap : GMSMapView!
    
    // 取得した緯度を保持するインスタンス
    var latitude: CLLocationDegrees!
    // 取得した経度を保持するインスタンス
    var longitude: CLLocationDegrees!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  latitude = CLLocationDegrees()
      //  longitude = CLLocationDegrees()
        
        latitudeLabel.text = "\(latitude)"
        longitudeLabel.text = "\(longitude)"
        

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
