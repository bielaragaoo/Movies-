//
//  ViewController.swift
//  Movies
//
//  Created by Gabriel Aragao on 25/04/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "MovieCell"
    var movies: MoviesData?

    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        popularMovies()
        table.delegate = self
        field.delegate = self
        table.dataSource = self
    
        DispatchQueue.main.async { [self] in
            table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies?.results.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovielCell
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        
        cell.configure(title: movies?.results[indexPath.row].title, overview: movies?.results[indexPath.row].overview, popularity: String((movies?.results[indexPath.row].popularity) ?? 1))
       
        let urlPoster = "https://image.tmdb.org/t/p/original/"
        let indexPoster = movies?.results[indexPath.row].poster_path ?? "74xTEgt7R36Fpooo50r9T25onhq.jpg"
        
        let url = URL(string: "\(urlPoster)\(indexPoster)")
//        let url = URL(string: "https://image.tmdb.org/t/p/original/74xTEgt7R36Fpooo50r9T25onhq.jpg")
        
        let data = try! Data(contentsOf: url!)
        
        cell.imageView!.image = UIImage(data: data)
        cell.imageView?.contentMode = .scaleAspectFill
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        field.text = " "
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field.endEditing(true)
        
        print(field.text!)
        return true
    }
    
    func popularMovies() {
        let popularMoviesURL = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=e5803888680a1daba772455ad6964c56"
        
        //        print(popularMoviesURL)
        performRequest(popularMoviesURL: popularMoviesURL)
        
    }
    
    func performRequest(popularMoviesURL: String) {
        
        if let url = URL(string: popularMoviesURL) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(moviesData: safeData)
                    //            print(dataString)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(moviesData: Data) {
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(MoviesData.self, from: moviesData)
            movies = decodedData
//            index = decodedData.results.count
//            movieName = decodedData.results[0].title
//            overview = decodedData.results[0].overview
//            popularity = decodedData.results[0].popularity
        } catch {
            print(error)
        }
    }

}
