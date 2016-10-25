//
//  ViewController.swift
//  EChartsDemo
//
//  Created by 郑国凯 on 2016/10/20.
//  Copyright © 2016年 kFoodie. All rights reserved.
//

import UIKit
import WebViewJavascriptBridge

var bridge: WebViewJavascriptBridge!

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebViewJavascriptBridge.enableLogging()
        
        bridge = WebViewJavascriptBridge(for: webView)
        bridge.setWebViewDelegate(self)
        bridge.callHandler("iOSCallBack", data: "")
        
        bridge.registerHandler("callViewLoad") { (data, callBack) in
            
            print("JS 给 iOS 的 data = \(data)")
            
            callBack!("iOS 给 JS 的 data")
        }
        
        let url = Bundle.main.url(forResource: "/ECharts/index", withExtension: ".html")
        webView.loadRequest(URLRequest(url: url!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSelectedArea() {
        
    }


}


