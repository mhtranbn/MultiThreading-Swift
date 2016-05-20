//
//  ViewController.swift
//  MultiThreading Swift
//
//  Created by prasad on 2/16/16.
//  Copyright © 2016 prasad. All rights reserved.
//

import UIKit

let imageUrls = ["http://placehold.it/120x120&text=image1","http://placehold.it/120x120&text=image2","http://placehold.it/120x120&text=image3","http://placehold.it/120x120&text=image4"]


class DownloadImage {
    
    class func downloadImages(URL: String) -> UIImage! {
        
        let image = NSData(contentsOfURL: NSURL(string: URL)!)
        //print(image)
        return UIImage(data: image!)
        
    }
}

class ViewController: UIViewController {

    @IBOutlet var image2: UIImageView!
    
    @IBOutlet var image4: UIImageView!
    
    @IBOutlet var image1: UIImageView!
    
    @IBOutlet var image3: UIImageView!
    
    @IBOutlet var label: UILabel!
    
    @IBAction func slider(sender: UISlider) {
        
        label.text = "\(sender.value * 100)";
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func start(sender: UIButton) {
        
        let queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL)
        
        dispatch_async(queue, {
            let image = DownloadImage.downloadImages(imageUrls[0])
            
            dispatch_async(dispatch_get_main_queue(), {
                self.image1.image = image
            
            })
        })
        
        dispatch_async(queue, {
            let image = DownloadImage.downloadImages(imageUrls[1])
            
            dispatch_async(dispatch_get_main_queue(), {
                self.image2.image = image
                
            })
        })
        
        dispatch_async(queue, {
            let image = DownloadImage.downloadImages(imageUrls[2])
            
            dispatch_async(dispatch_get_main_queue(), {
                self.image3.image = image
                
            })
        })
        
        dispatch_async(queue, {
            let image = DownloadImage.downloadImages(imageUrls[3])
            
            dispatch_async(dispatch_get_main_queue(), {
                self.image4.image = image
                
            })
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

