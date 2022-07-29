//  EmailJoinViewController.swift


import UIKit
import FirebaseAuth

class EmailJoinViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func emailJoinButton(_ sender: UIButton) {
    
        // 사용자가 입력한 이메일과 비밀번호 가져오기
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
 
        // 신규 사용자 생성하기
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] authResult, error in
            guard let self = self else { return }
            
        // 발생한 에러 처리하기
            if let error = error {
                let code = (error as NSError).code
                switch code {
                case 17007 : //이미 가입한 계정일 때 로그인 하기
                    self.loginUser()
                }
            }
            
        // 메인 화면으로 이동하기
        self.showMainViewController()
        }
    }
    
    //메인 화면으로 이동하기
    private func showMainViewController() {
        let storyboard = UIStoryboard(name:"Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "FirstVC")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
}
