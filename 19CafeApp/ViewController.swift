//
//  ViewController.swift
//  19CafeApp
//
//  Created by 김성진 on 2022/07/26.
//

//추가기능
//1. 구글맵 연동
//2. 파이어베이스(회원가입, 로그인, DB, 저장소)
//3. 모바일 광고 배너
//4. 푸시알람
//5. 사이드메뉴
//6. 쿠폰 발급 화면
//7. 카페앱 공식 앱을 참조

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //네비게이션 바를 보이게 함
        self.navigationController?.isNavigationBarHidden = true
        
        // 현재 로그인한 사용자의 이메일 가져오기
        let email = Auth.auth().currentUser?.email ?? "User"
        
        // 라벨에 이메일 뿌려주기
        welcomeLabel.text = """
        환영합니다.
        \(email)님
        """
    }


}

