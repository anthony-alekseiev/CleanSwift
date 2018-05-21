//
//  AlbumStoreViewController.swift
//  Clean Albums
//
//  Created by Anton Aleksieiev on 5/21/18.
//  Copyright © 2018 fynjyass. All rights reserved.
//

import UIKit
import WebKit

class AlbumStoreViewController: UIViewController {
    
    @IBOutlet weak var albumWebView: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let string = urlString,
            let myURL = URL(string: string) else {return}
        let myRequest = URLRequest(url: myURL)
        albumWebView.load(myRequest)
    }
    
}
