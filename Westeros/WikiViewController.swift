//
//  WikiViewController.swift
//  Westeros
//
//  Created by Carlos Ledesma on 17/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {

    let model : House
    
    @IBOutlet weak var browserView: UIWebView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    init(model: House) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func syncViewWithModel() {
        activityView.isHidden = false
        activityView.startAnimating()
        title = model.name
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wikiURL))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewWithModel()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityView.stopAnimating()
        activityView.isHidden = true
        
    }
    
    func webView(_ webView: UIWebView,
                 shouldStartLoadWith request: URLRequest,
                 navigationType: UIWebViewNavigationType) -> Bool {
        if (navigationType == .linkClicked ) || (navigationType == .formSubmitted) {
            return false
        }
        return true
    }
}
