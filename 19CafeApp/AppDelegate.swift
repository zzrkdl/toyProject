//
//  AppDelegate.swift
//  19CafeApp
//
//  Created by 김성진 on 2022/07/26.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn //구글 회원가입, 로그인을 위해서 임포트

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    
    //회원가입
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {  //에러처리
            print("ERROR Google Sign In \(error.localizedDescription)")
            return
        }
        
        //사용자 인증값 가져오기
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        // Firebase Auth에 인증정보 등록하기(회원가입)
        Auth.auth().signIn(with: credential) { _, _ in
            self.showMainViewController()   // 메인 화면으로 이동
        }
    }
    
    // 메인 화면으로 이동하기
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "FirstVC")
        mainViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.windows.first?.rootViewController?.show(mainViewController, sender: nil)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        //Firebase 초기화
        FirebaseApp.configure()
        
        //google 로그인 Delegate
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        //  구글의 인증 프로세스가 끝날 때 앱이 수신하는 url 처리
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
     
    }


}

