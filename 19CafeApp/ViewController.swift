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
import Firebase
import Foundation
class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nowStatusUI()
        
        navigationController?.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //네비게이션 바를 보이게 함
        self.navigationController?.isNavigationBarHidden = true
    }

    func nowStatusUI() {
        // 현재 로그인한 사용자 정보 가져오기
        let user = Auth.auth().currentUser
        let loginUser = user?.email // 사용자 정보에서 로그인 한 이메일을 가져온다
        
        let resultUser = loginUser?.components(separatedBy: "@")  // 이메일 @ 기준으로 배열로 쪼갠다
        
        // 라벨에 이메일 뿌려주기 resultUser의 0번쨰 배열을 가저와서 뿌려준다.
        welcomeLabel.text = "\(String(describing: resultUser![0]))님 환영합니다"
    }

    @IBAction func onBtnFirst(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError {
            print("SignOutError: %@", signOutError)
        }

    }
    
    // 메인 화면으로 이동하기
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "StartVC")
        mainViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.windows.first?.rootViewController?.show(mainViewController, sender: nil)
    }

    
}
