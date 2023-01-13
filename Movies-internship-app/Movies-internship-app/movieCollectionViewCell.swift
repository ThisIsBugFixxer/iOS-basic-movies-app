//
//  movieCollectionViewCell.swift
//  Movies-internship-app
//
//  Created by Priyam Mehta on 12/01/23.
//

import UIKit



protocol cellMovieProtocol {
    
    func movieCellA(indexPath: IndexPath)
}

class movieCollectionViewCell: UICollectionViewCell {
    
  
    @IBOutlet weak var imgBtn: UIButton!
    
    @IBOutlet weak var movieTitleBtn: UIButton!
    
   
    
    var filmProtocol:cellMovieProtocol?
    
    var indexPath:IndexPath?
    
    @IBAction func actnBtn(_ sender: UIButton) {
        filmProtocol?.movieCellA(indexPath: indexPath!)
//        print("===== wasssup ======")
    }

    
}

