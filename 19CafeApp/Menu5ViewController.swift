//  Menu5ViewController.swift

import UIKit
import WebKit

class Menu5ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 바를 보이게 함
        self.navigationController?.isNavigationBarHidden = false
        
        loadWebPage("http://paikdabang.com/store/")
    }
    

    func loadWebPage(_ url:String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        
        webView.load(myRequest)
    }
   

}
