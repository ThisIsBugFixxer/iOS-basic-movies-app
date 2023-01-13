//
//  ViewController.swift
//  Movies-internship-app
//
//  Created by Priyam Mehta on 12/01/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var FilmCollectionView: UICollectionView!
    
    
    var movieList = [MovieModel]()
    var movieListJson = [JsonMovieModel]() // a new model just for testing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiCollViewFL:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let uiFW = self.FilmCollectionView.frame.size.width
        
        uiCollViewFL.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        uiCollViewFL.minimumLineSpacing = 10
        uiCollViewFL.minimumInteritemSpacing = 10
        
        let uiCellDim = (uiFW-30)/2
        
        uiCollViewFL.itemSize = CGSize(width: uiCellDim, height: uiCellDim*2)
        
        FilmCollectionView.collectionViewLayout = uiCollViewFL
        
        FilmCollectionView.delegate = self
        FilmCollectionView.dataSource = self
        
        let f1 = MovieModel(var: 1, var: "Avatar", var: "indir", var: 15.99)
        
        let f2 = MovieModel(var: 2, var: "Godfather", var: "indir", var: 14.99)
        
        let f3 = MovieModel(var: 3, var: "Good Bad Ugly", var: "indir", var: 17.99)
        
        let f4 = MovieModel(var: 4, var: "Logan", var: "indir", var: 19.99)
        
        let f5 = MovieModel(var: 5, var: "Lord of War", var: "indir", var: 16.99)
        
        let f6 = MovieModel(var: 6, var: "Shutter Island", var: "indir", var: 11.99)
        
        movieList.append(f1)
        movieList.append(f2)
        movieList.append(f3)
        movieList.append(f4)
        movieList.append(f5)
        movieList.append(f6)
        
        
        makeRequest()
        
    }
    
    func makeRequest(){
        let url = URL(string: "https://task.auditflo.in/1.json")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                print(" ==== 1 Error: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        print("==== 4 Error: Invalid HTTP response code")
                        return
                    }
            guard let data = data else {
                print(" ===== 2 Error: no data")
                return
            }
            do {
                print("====== 5 \(String(data: data, encoding: .utf8)!)") // ERROR IN DATA (ONLY RECEVINING "{"
                let json = try JSONDecoder().decode(JsonMovieModel.self, from: data)
                self.movieListJson.append(json)
                print("==== Json Data is \(json) \(self.movieListJson.count) ===========")
                
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//
//                }
                
            } catch {
                print("===== 3 Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }


}

extension UICollectionViewCell {
    public func shadowDecorate() {
        
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        
    }
}



extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, cellMovieProtocol {
    
  
    func movieCellA(indexPath: IndexPath) {
        let film = movieList[indexPath.row]
        print("\(film.movieTitle!) filmi siparis verildi.")
        
        // Sending the data to the new screen
        if let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController (identifier: "DetailsView") as?
            DetailsViewController {
            vc.movieData = movieList[indexPath.row]
                self.navigationController?.pushViewController(vc,animated:true)
                    }
    }
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let film = movieList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! movieCollectionViewCell
        
        
        cell.movieTitleBtn.setTitle(film.movieTitle!, for: .normal)
        cell.imgBtn.setBackgroundImage(UIImage(named: film.movieImageName!), for: .normal)

//   
        
        
        
        cell.filmProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = movieList[indexPath.row]
        print("\(film.movieTitle!) movie/film selected. =========== ")
//        if let vc = storyboard?.instantiateViewController (identifier: "DetailsViewController") as?
//            DetailsViewController {
//            vc.movieData = movieList[indexPath.row]
//                self.navigationController?.pushViewController(vc,animated:true)
//                    }
    }
    
    
}

