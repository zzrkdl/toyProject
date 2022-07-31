// LoginViewController.swift

import UIKit
import GoogleSignIn
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController , UITextViewDelegate{


    @IBOutlet weak var textfieldID: UITextField!
    @IBOutlet weak var textfieldPW: UITextField!
 
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance().presentingViewController = self
        navigationController?.navigationBar.isHidden = false
    }

    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
  
  
  
    @IBAction func onBtnLogin(_ sender: UIButton) {
        if let textID = textfieldID.text, let textPW = textfieldPW.text {
            
            if textID.count < 1 || textPW.count < 1 {
                print("아이디나 암호가 짧습니다.")
                return
            }
            Auth.auth().signIn(withEmail: textID, password: textPW) {
                //후행 클로저
                [weak self] user, error in
                guard let self = self else { return }
               
                if let error = error {
                    self.errorMessageLabel.text = error.localizedDescription
                    print(self.errorMessageLabel.text!)
                } else {
                    self.showMainViewController()
                }
            }
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
