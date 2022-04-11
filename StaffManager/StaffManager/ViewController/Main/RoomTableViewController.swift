//
//  RoomTableViewController.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 09/04/2022.
//

import UIKit

class RoomTableViewController: UITableViewController {

    let userViewModel = UserViewModel()
    var roomData: [RoomData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userViewModel.getRooms()
    }
    
    private func bind() {
        userViewModel.errorMessage.bind { [weak self] msg in
            if !msg.isEmpty {
                self?.presentAlert("Error", msg, handler: nil)
            }
        }
        
        userViewModel.roomData.bind { [weak self] result in
            self?.roomData = result
            self?.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomViewCell", for: indexPath) as! RoomViewCell
        cell.roomID.text = "Room ID: \(roomData[indexPath.row].id ?? "")"
        cell.maximumOccupants.text = "Maximum Occupancy: \(roomData[indexPath.row].maxOccupancy ?? 0)"
        cell.isOccupied.text = "Is Occupied: \(roomData[indexPath.row].isOccupied ?? false)"
        
        cell.applyAccessibilty(roomData[indexPath.row])
        return cell
    }
    
}
