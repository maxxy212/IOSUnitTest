//
//  PeopleTableViewController.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 09/04/2022.
//

import UIKit

class PeopleTableViewController: UITableViewController, UISplitViewControllerDelegate {

    let userViewModel = UserViewModel()
    var peopleData: [PeopleData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        bind()
        adddIdentifiers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userViewModel.getPeople()
    }
    
    private func bind() {
        userViewModel.errorMessage.bind { [weak self] msg in
            if !msg.isEmpty {
                self?.presentAlert("Error", msg, handler: nil)
            }
        }
        
        userViewModel.peopleData.bind { [weak self] result in
            self?.peopleData = result
            self?.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleViewCell", for: indexPath) as! PeopleViewCell
        cell.profileImage.setImageWithURL(url: peopleData[indexPath.row].avatar!)
        cell.nameLabel.text = peopleData[indexPath.row].firstName! + " " + peopleData[indexPath.row].lastName!
        cell.applyAccessibilty(peopleData[indexPath.row])
        return cell
    }
    
    private var lastSeguedToPersonalDetailViewController: PersonDetailViewController?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = splitViewDetailProfileViewController {
            vc.peopleData = peopleData[indexPath.row]
        }else if let vc = lastSeguedToPersonalDetailViewController {
            vc.peopleData = peopleData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PersonDetailViewController") as! PersonDetailViewController
            vc.peopleData = peopleData[indexPath.row]
            lastSeguedToPersonalDetailViewController = vc
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private var splitViewDetailProfileViewController: PersonDetailViewController?{
        return splitViewController?.viewControllers.last as? PersonDetailViewController
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }

    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let vc = secondaryViewController as? PersonDetailViewController {
            if vc.peopleData == nil {
                return true
            }
        }
        return false
    }
    
    private func adddIdentifiers() {
        view.accessibilityIdentifier = "PeopleTableView"
    }
    

}
