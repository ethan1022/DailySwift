//
//  ViewController.swift
//  Day8
//
//  Created by Ethan on 2016/7/12.
//  Copyright © 2016年 Ethan. All rights reserved.
//

import UIKit

// 要使用imagePicker需要讓viewController遵從UIImagePickerControllerDelegate以及UINavigationControllerDelegate才能使用
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var picImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func doCamera(sender: AnyObject) {
        
        // 設定alert，選擇相片來源
        let alert = UIAlertController(title: "選擇相片來源", message: nil, preferredStyle: .ActionSheet)
        
        // camera的按鈕設定
        let camera = UIAlertAction(title: "相機", style: .Default) { (camera) in
            
            // 選擇imagePicker的來源
            self.imagePicker.sourceType = .Camera
            
            // 設定imagePicker的delegate（委託viewController來執行imagePicker要他做的事情）
            self.imagePicker.delegate = self
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        let photo = UIAlertAction(title: "相片", style: .Default) { (photo) in
            //
            self.imagePicker.sourceType = .PhotoLibrary
            self.imagePicker.delegate = self
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        // 增加按鈕
        alert.addAction(camera)
        alert.addAction(photo)
        alert.addAction(cancel)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // 呼叫imagePicker選擇好照片的時候，系統會自動呼叫此function
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // info中有著不同的key，這一次只用原始圖片的key
        let imagePicked = info[UIImagePickerControllerOriginalImage] as! UIImage
        picImage.image = imagePicked
        
        // 選擇好照片之後，自動dismissViewController
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }


}

