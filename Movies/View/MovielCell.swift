//
//  MovielCell.swift
//  Movies
//
//  Created by Gabriel Aragao on 27/04/22.
//
import UIKit

class MovielCell: UITableViewCell{
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieSinopse: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    func configure(title: String?, overview: String?, popularity: String?) {
        
        movieName.text = title
        movieSinopse.text = overview
        movieYear.text = popularity
    }
                
}
