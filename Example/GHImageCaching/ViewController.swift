//
//  ViewController.swift
//  GHImageCaching
//
//  Created by George Hanna Adly on 02/03/2016.
//  Copyright (c) 2016 George Hanna Adly. All rights reserved.
//

import UIKit
import GHImageCaching

class ViewController: UIViewController {

    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func removeAllCachedImage(sender: AnyObject) {
        UIImageView.deleteAllCachedData()
    }
    @IBAction func RequestBtn(sender: AnyObject) {
        imgView.getCachedImage("georgehadly", URI: NSURL(string: "https://s-media-cache-ak0.pinimg.com/236x/8e/5a/98/8e5a98795dc2c5322cac97343a6cad6d.jpg")!) { (done) -> Void in
                        if(done){
                            print ("Done")
                        }
                    }
    }
}

