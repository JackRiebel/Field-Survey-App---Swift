//
//  FieldObservationsViewController.swift
//  Field Survey
//
//  Created by Jack Riebel on 11/19/21.
//

import UIKit

class FieldObservationsDetailViewController: UIViewController {
        
    
    @IBOutlet weak var ObservationImage: UIImageView!
    @IBOutlet weak var ObservationTitle: UILabel!
    @IBOutlet weak var ObservationDate: UILabel!
    @IBOutlet weak var ObservationDescription: UITextField!
    
    var observation_image: UIImage?
    var observation_name: String?
    var observation_date: String?
    var observation_description: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ObservationImage?.image = observation_image
        ObservationTitle?.text = observation_name
        ObservationDate?.text = observation_date
        ObservationDescription?.text = observation_description


        // Do any additional setup after loading the view.
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
