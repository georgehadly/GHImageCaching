//
//  UIImageView+Caching.swift
//  Enaya
//
//  Created by George Hanna Adly on 1/31/16.
//  Copyright © 2016 George Hanna Adly. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    public static func deleteAllCachedData() ->Void{
        
        let fileManager:NSFileManager = NSFileManager.defaultManager()
        do {
            let cacheFiles:Array = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(UIImageView.cachePathForFile("")!)
            for file:String in cacheFiles
            {
                do{
                    try fileManager.removeItemAtPath(UIImageView.cachePathForFile(file)!)
                }
                catch{
                    print (error)
                }
            }
        }
        catch{
            print(error)
        }
    }
    
    public static func cachePathForFile(fileName: String?)->String? {
        let fileManager = NSFileManager.defaultManager()
        do {
            let  documentsDir = try fileManager.URLForDirectory(NSSearchPathDirectory.CachesDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true)
            if(NSBundle.mainBundle().objectForInfoDictionaryKey("GHCachingPath")?.length > 0)
            {
                let path = documentsDir.path! + "/\(NSBundle.mainBundle().objectForInfoDictionaryKey("GHCachingPath")!)/"
                if (!fileManager.fileExistsAtPath(path)){
                    do{
                        try fileManager.createDirectoryAtPath(path, withIntermediateDirectories: false, attributes: nil)
                    }
                    catch{
                        print("error")
                    }
                }
                return path + fileName!
            }
            return nil
        }
        catch{
            print(error)
        }
        return nil
    }
    
    public func getCachedImage(key:String,data:NSData) ->Void{
        let fileManager:NSFileManager = NSFileManager.defaultManager()
        if(fileManager.fileExistsAtPath(UIImageView.cachePathForFile("\(key)")!) == true){
            dispatch_async(dispatch_get_main_queue(), {
                self.image = UIImage(contentsOfFile: UIImageView.cachePathForFile("\(key)")!)
            })
        }
        else if (data.length > 0){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
                data.writeToFile(UIImageView.cachePathForFile("\(key)")!, atomically: true)
                dispatch_async(dispatch_get_main_queue(), {
                    self.image = UIImage(data: data)
                })
            }
        }
    }
    
    public func getCachedImage(key:String,URI:NSURL,completion:(done:Bool) -> Void)->Void{
        let fileManager:NSFileManager = NSFileManager.defaultManager()
        if(fileManager.fileExistsAtPath(UIImageView.cachePathForFile("\(key)")!) == true){
            dispatch_async(dispatch_get_main_queue(), {
                self.image = UIImage(contentsOfFile: UIImageView.cachePathForFile("\(key)")!)
                completion(done: true)
            })
        }
        else{
            NSURLSession.sharedSession().dataTaskWithURL(URI) { (data, response, error) in
                if ((data) != nil){
                    data!.writeToFile(UIImageView.cachePathForFile("\(key)")!, atomically: true)
                    dispatch_async(dispatch_get_main_queue(), {
                        self.image = UIImage(data: data!)
                        completion(done: true)
                    })
                }
                else {
                    completion(done: false)
                }
                }.resume()
        }
    }
}
