//
//  ViewController.swift
//  TestSwift
//
//  Created by Alex on 2019/9/16.
//  Copyright © 2019 alex. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let wkwebview = WKWebView()
        

        print("1")
        wkwebview.evaluate(script: "21") { (res, error) in
            print("2")
        }
        print("3")
    }


}


extension WKWebView {
    func evaluate(script: String, completionHandler: @escaping (_ result: AnyObject?, _ error: Error?) -> Void) {
        var finished = false
        
        evaluateJavaScript(script) { (result, error) in
            if error == nil {
                if result != nil {
                    completionHandler(result as AnyObject, nil)
                }
            } else {
                completionHandler(nil, error as Error?)
            }
            finished = true
        }
        
        while !finished {
            RunLoop.current.run(mode: .default, before: Date.distantFuture)
        }
    }
}
