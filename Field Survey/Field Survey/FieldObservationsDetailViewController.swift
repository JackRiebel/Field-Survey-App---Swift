//
//  FieldObservationsDetailViewController.swift
//  Field Survey
//
//  Created by Jack Riebel on 11/19/21.
//

import UIKit

class FieldObservationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let jsonFileName = "field_observations" // .json not included here because it is added when doing the loading
    let dateFormatter = DateFormatter()
    var fieldObservations: FieldObservations?
    
    @IBOutlet weak var FieldSurveyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "MMMM d, y h:mm a"
        dateFormatter.amSymbol = "am"  // by default it is AM and PM
        dateFormatter.pmSymbol = "pm"
        
        guard let fieldObservations = FieldObservationsLoader.load(jsonFileName: jsonFileName) else {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
            return
        }
        
        if fieldObservations.status != "ok" {
            presentMessage(message: "Status is not okay for \(jsonFileName).json")
            return
        }
        
        self.fieldObservations = fieldObservations
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldObservations?.observations.count ?? 0  // if can be unwarpped use count of events others use 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        
        if let fieldObservations = self.fieldObservations {
            let observation = fieldObservations.observations[indexPath.row]
            cell.textLabel?.text = observation.title
            cell.detailTextLabel?.text = dateFormatter.string(from: observation.date)
            cell.imageView?.image = UIImage(named: observation.classification.rawValue)
        }
        
        return cell
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldObservationsDetailViewController, let indexPath = FieldSurveyTableView.indexPathForSelectedRow {
            
            let event = fieldObservations!.observations[indexPath.row]
            
            destination.observation_image = UIImage(named: event.classification.rawValue)
            destination.observation_name = event.title
            destination.observation_date = dateFormatter.string(from: event.date)
            destination.observation_description = event.description
        }
    }

}
