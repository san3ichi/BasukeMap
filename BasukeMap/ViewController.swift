//
//  ViewController.swift
//  BasukeMap
//
//  Created by 佐々井健吾 on 2017/01/12.
//  Copyright © 2017年 kenren. All rights reserved.
//

import UIKit
import ESTabBarController

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
    }
    
    func setupTab() {
        // 画像のファイル名を指定してESTabBarControllerを作成する
        let tabBarController: ESTabBarController! = ESTabBarController(tabIconNames: ["Map", "basketball", "PostMap", "Setting"])
        
        // 背景色、選択時の色を設定する
        tabBarController.selectedColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        tabBarController.buttonsBackgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        
        // 作成したESTabBarControllerを親のViewController（＝self）に追加する
        addChildViewController(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.view.frame = view.bounds
        tabBarController.didMove(toParentViewController: self)
        
        // タブをタップした時に表示するViewControllerを設定する
        let mapViewController = storyboard?.instantiateViewController(withIdentifier: "Map")
        let listViewController = storyboard?.instantiateViewController(withIdentifier: "List")
        let mapPostViewController = storyboard?.instantiateViewController(withIdentifier: "MapPost")
        let settingViewController = storyboard?.instantiateViewController(withIdentifier: "Setting")
        
        tabBarController.setView(mapViewController, at: 0)
        tabBarController.setView(listViewController, at: 1)
        tabBarController.setView(mapPostViewController, at: 2)
        tabBarController.setView(settingViewController, at: 3)
        
        /*
         // 真ん中のタブはボタンとして扱う
         tabBarController.highlightButton(at: 1)
         tabBarController.setAction({
         // ボタンが押されたらImageViewControllerをモーダルで表示する
         let imageViewController = self.storyboard?.instantiateViewController(withIdentifier: "ImageSelect")
         self.present(imageViewController!, animated: true, completion: nil)
         }, at: 1)
         */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
