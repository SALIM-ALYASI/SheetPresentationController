//
//  SheetPresentationControllerViewController.swift
//  SheetPresentationController
//
//  Created by الياسي on 26/02/2022.
//
var nationality = ""
import UIKit

class SheetPresentationControllerViewController: UIViewController, UISheetPresentationControllerDelegate {
    var nationalities = [CountryName]()
    var deviceMemory:String?
    @IBOutlet weak var ITableView: UITableView!
    override var sheetPresentationController:UISheetPresentationController{
    presentationController as! UISheetPresentationController
    
    }
    @IBOutlet weak var searchBar: UISearchBar!
    var isSearching = false
    var filteredArray  =  [CountryName]()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        getData() 
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .medium
      
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.detents = [.medium(),.large()]
    }
     func getData() {
         
         if Locale.current.languageCode == "ar" {
             deviceMemory = "ar"
           }else{
               deviceMemory = "en"
              
         }
    
            let urlString =  "https://alluban-alfakher.com/Ryadia_New/public/api/nationality"
                guard let urlString = URL(string: urlString) else { return }
                var requestAPI = URLRequest(url: urlString)
    
                requestAPI.httpMethod = "GET"
                requestAPI.addValue(deviceMemory ?? "", forHTTPHeaderField: "localization")
                requestAPI.addValue("application/json", forHTTPHeaderField: "Accept")
    //            requestAPI.setValue("Bearer \("appDelegate.userAppToken")", forHTTPHeaderField: "Authorization")
    
                let task = URLSession.shared.dataTask(with: requestAPI) { (data, response, error) in
                    if let datas = data {
                        do {
                           let json = try JSONDecoder().decode(NationalityName.self, from: datas)
                            print ("44;",json)
                            self.nationalities.removeAll()
                            self.nationalities.append( contentsOf: json.countries  )
                            self.filteredArray.append( contentsOf: json.countries  )
                            print("Seems to have an error: \(json)")
                            DispatchQueue.main.async {
                            self.ITableView.reloadData()
                            }} catch let error {
                            print(222,error.localizedDescription)
                            print("Seems to have an error: \(error)")
                        }
                    }
                }
                task.resume()
            }

 

}
//VolunteerinitiativesCell
extension SheetPresentationControllerViewController:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredArray.count
        }
        else {
            return nationalities.count
        }
        
    }
 
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        //cell.Label.text = nationalities[indexPath.row].nationality
        if isSearching {
            cell.Label.text = filteredArray[indexPath.row].nationality ?? ""
        }
        else {
            cell.Label.text =  nationalities[indexPath.row].nationality
        }
        return cell
      
      
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nationality =  filteredArray[indexPath.row].nationality ?? ""
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension SheetPresentationControllerViewController : UISearchBarDelegate {
    // Search coding part
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredArray.removeAll()
        
        if searchText == "" {
            isSearching = false
        }
        else {
            isSearching = true
            filteredArray = nationalities.filter({ (country) -> Bool in
                return country.nationality?.lowercased().contains(searchText.lowercased()) ?? true
            })
        }
        print("filteredArray : \(filteredArray)")
        ITableView.reloadData()
    }
    
}
// MARK: - NationalityName
struct NationalityName: Codable {
    let status: Bool
    let code: Int
    let message: String
    let countries: [CountryName]
}

// MARK: - CountryName
struct CountryName: Codable {
    let id: Int?
    let nationality: String?
}
