//
//  RefrigetorTableViewController.swift
//  
//
//  Created by 김호중 on 2020/04/27.
//

import UIKit
import RealmSwift

class RefrigetorTableViewController: UITableViewController {

    var list: Results<Food>?
    var dateFormat: DateFormatter = DateFormatter()
    var notificationToken: NotificationToken!
    var realm: Realm!

    func setupRealm() {
        try! realm = Realm()
        
        func updateList() {
            if list == nil {
                list = self.realm.objects(Food.self)
            }
            self.tableView.reloadData()
            
        }
        updateList()
        
        self.notificationToken = self.realm.observe { notification, realm in
            updateList()
        }
    }

    deinit {
        notificationToken.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormat.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd", options: 0, locale: Locale(identifier: "ja_JP"))
        
        setupRealm()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let list = list else {
            return 0
        }
        
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "warehouseCell")!
        
        guard let list = list else { return cell }
        
        let row = list[indexPath.row]
        cell.textLabel?.text = row.name
        cell.detailTextLabel?.text = "유통기한: \(dateFormat.string(from: row.expDate))"

        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("Touch Table Row at %d", indexPath.row)
        
    }

    @IBAction func unwindToMainViewController(segue : UIStoryboardSegue) {
    
    }
    
    @IBAction func unwindToMainViewControllerAndRefreshList(seque : UIStoryboardSegue) {
        
    }

   
    

}
