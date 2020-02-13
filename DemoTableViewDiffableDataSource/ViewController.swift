//
//  ViewController.swift
//  DemoTableViewDiffableDataSource
//
//  Created by Apple on 28/01/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Section: CaseIterable {
        case main
    }
    
    //MARK:- OUTLET -
    @IBOutlet weak var tblList: UITableView!
    
    //MARK:- VARIABLES -
    var countries: [Country] = []
    var datasource : UITableViewDiffableDataSource<Section, Country>!
    

    //MARK:- VIEW METHODS -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countryNames = ["Afghanistan",
                            "Albania",
                            "Algeria",
                            "Andorra",
                            "Angola",
                            "Antigua and Barbuda",
                            "Argentina",
                            "Armenia",
                            "Australia",
                            "Austria",
                            "Azerbaijan",
                            "Bahamas",
                            "Bahrain",
                            "Bangladesh",
                            "Barbados",
                            "Belarus",
                            "Afghanistan",
                            "Albania",
                            "Algeria",
                            "Andorra",
                            "Angola",
                            "Antigua and Barbuda",
                            "Argentina",
                            "Armenia",
                            "Australia",
                            "Austria",
                            "Azerbaijan",
                            "Bahamas",
                            "Bahrain",
                            "Bangladesh",
                            "Barbados",
                            "Belarus"]
        for name in countryNames {
            countries.append(Country(name: name))
        }

       //CellForRow
        datasource = UITableViewDiffableDataSource<Section, Country>(tableView: tblList) { (tableView :UITableView,indexPath:IndexPath, country: Country) -> UITableViewCell? in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = country.name
            return cell
        }
        datasource.defaultRowAnimation = .fade
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
   
        var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
        snapshot.appendSections([.main])
        //Number of rows append
        snapshot.appendItems(countries, toSection: .main)
        //UITableView load Cell
        datasource.apply(snapshot, animatingDifferences: true)
    }
}


//MARK:- EXTENSION -
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let country = datasource.itemIdentifier(for: indexPath) {
            print("Selected country \(country.name)")
        }
    }
}

