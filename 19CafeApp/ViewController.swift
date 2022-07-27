//
//  ViewController.swift
//  19CafeApp
//
//  Created by 김성진 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //네비게이션 바를 보이게 함
        self.navigationController?.isNavigationBarHidden = true
    }


}

