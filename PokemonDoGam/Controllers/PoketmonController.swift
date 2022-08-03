//
//  PoketmonController.swift
//  PokemonDoGam
//
//  Created by 김성진 on 2022/08/03.
//

import UIKit

let reuseableIdentifier = "poketmonncell"


class PoketmonController : UICollectionViewController {
    // MARK : Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    // MARK : override
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?){
        // 이 함수는 디바이스의 테마가 변경될 때마다 호출이 되는 함수입니다.
        adjustColor()
    }
    
    //MARK : Selectors
    @objc func searchTapped(){
        print("search tapped")
    }
    
    //핸드폰 화면 모드에 따라 이미지 색상 변경
    func adjustColor(){
       
      if  self.traitCollection.userInterfaceStyle == .dark {
          // 다크모드일때
          navigationController?.navigationBar.tintColor = .white
      } else {
          // 라이트모드일때
          navigationController?.navigationBar.tintColor = .black
      }
    }
    
    //MARK : Helper
    func configureViewComponents(){     //네비게이션 탭 바 색상바꿈
        collectionView.backgroundColor = .systemBackground
        let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor = UIColor.mainColor
                appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                navigationItem.standardAppearance = appearance
                navigationItem.scrollEdgeAppearance = appearance
        
        self.title = "포켓몬 도감"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(searchTapped))
        adjustColor()
        
        collectionView.register(PoketmonCell.self, forCellWithReuseIdentifier: reuseableIdentifier)
        
    }
}
//MARK : collectionViewCell delegate functions
extension PoketmonController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! PoketmonCell
        return cell
    }
}
