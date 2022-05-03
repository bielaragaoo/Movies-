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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "MovieCell"
    
    func nib() -> UINib {
        return UINib(nibName: "MovieCell", bundle: nil)
    }
    
    func configure(title: String?, overview: String?, popularity: String?) {
        
        movieName.text = title
        movieSinopse.text = overview
        movieYear.text = popularity
//        movieImage.image = poster
    }
                
}
