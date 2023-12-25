//
//  MVVMPracticeViewModel.swift
//  kimSeonWoo-seminar
//
//  Created by Seonwoo Kim on 2023/12/02.
//

import Foundation
import UIKit

class MVCPracticeViewModel: UITableViewDataSource{
    var soptModel : Observable<[SoptMember]> = Observable([SoptMember])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soptModel.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVC.identifier, for: indexPath) as? CustomTVC else {return UITableViewCell()}
        cell.setData(name: soptModel.value[indexPath.row].name,
                     isWinning: soptModel.value[indexPath.row].winning,
                     age: soptModel.value[indexPath.row].age)
        return cell
    }
    
    @objc private func randomButtonTap() {
        let randomIndex = Int.random(in: 0 ... self.soptModel.value.count - 1)
        self.soptModel.value[randomIndex].winning = true
        self.tableView.reloadData()
    }
}
