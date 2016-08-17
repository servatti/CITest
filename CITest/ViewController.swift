//
//  ViewController.swift
//  CITest
//
//  Created by Rafael Servatti on 8/16/16.
//  Copyright © 2016 Fera Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var label: UILabel!
    
    @IBAction func click() {
        
        let url = NSURL(string: "http://md5.jsontest.com/?text=example_text")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            let result = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            
            dispatch_async(dispatch_get_main_queue(), { 
                self.label.text = result as? String
            })
        }
        
        task.resume()
    }
}

