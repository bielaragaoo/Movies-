//
//  SelectionController.swift
//  Movies
//
//  Created by Gabriel Aragao on 03/05/22.
//

import UIKit

class SelectionController: UIViewController {

    var movies: MoviesData?
    
    var titlelbl: String?
    var popularitylbl: String?
    var overviewlbl: String?
    var img = UIImage()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBAction func voltarButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titlelbl
        popularityLabel.text = popularitylbl
        overviewLabel.text = overviewlbl
        
        posterImageView.image = img
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
