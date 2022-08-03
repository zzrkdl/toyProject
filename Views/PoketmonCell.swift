//
//  PoketmonCell.swift
//  PokemonDoGam
//
//  Created by 김성진 on 2022/08/03.
//

import UIKit

class PoketmonCell:UICollectionViewCell {
    
    // MARK : Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : Helpers
    func configureViewComponents(){
        self.backgroundColor = .tertiarySystemGroupedBackground
    }
}
