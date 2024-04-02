//
//  JoinViewController.swift
//  19CafeApp
//
//  Created by 김성진 on 2022/07/31.
//

import UIKit
import Firebase
import FirebaseAuth

class JoinViewController: UIViewController {

    
    
    
    @IBOutlet weak var textfieldID: UITextField!
    @IBOutlet weak var textfieldPW: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onBtnJoin(_ sender: UIButton) {
        if let textID = textfieldID.text , let textPW = textfieldPW.text {
            Auth.auth().createUser(withEmail: textID, password: textPW){
                authResult, error in
                guard let user = authResult?.user, error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                //회원가입 성공
                self.showMainViewController()
            }
        } else {
            print("아이디나 암호가 없습니다.")
        }
            
    }
    
    // 메인 화면으로 이동하기
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "FirstVC")
        mainViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.windows.first?.rootViewController?.show(mainViewController, sender: nil)
    }

    

}
