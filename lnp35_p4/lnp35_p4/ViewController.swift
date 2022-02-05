//
//  ViewController.swift
//  lnp35_p4
//
//  Created by Lily Pham on 10/23/21.
//

import UIKit

//protocol UpdateDescriptionDelegate: AnyObject {
//    func updateDescription(newString: String)
//}
//extension ViewController: UpdateDescriptionDelegate {
//    func updateDescription(newString: String) {
//        title = newString + "'s Profile"
//        self.description = newString
//    }
//}
//
//
//extension ViewController: UpdateImageDelegate {
//    func updateImage(newString: String) {
//        profileImageView1.image = UIImage(named: newString)
//        view.addSubview(profileImageView1)
//    }
//}


class ViewController: UIViewController {
    
    var tableView = UITableView()
    var purchases: [Spending] = []
    
    let reuseIdentifier = "spendingCellReuse"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Spending"
        view.backgroundColor = .white
        
        let purchase1 = Spending(transactionNum: 1, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase2 = Spending(transactionNum: 2, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase3 = Spending(transactionNum: 3, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase4 = Spending(transactionNum: 4, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase5 = Spending(transactionNum: 5, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase6 = Spending(transactionNum: 6, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase7 = Spending(transactionNum: 7, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase8 = Spending(transactionNum: 8, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase9 = Spending(transactionNum: 9, description: "Bought a pizza", category: .Food, amount: 12.93)
        let purchase10 = Spending(transactionNum: 10, description: "Bought a pizza", category: .Food, amount: 12.93)
        
        purchases = [purchase1, purchase2, purchase3, purchase4, purchase5, purchase6, purchase7, purchase8, purchase9, purchase10]
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SpendingTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setupConstraints()
    }
    
    func setupConstraints() {
//        Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SpendingTableViewCell {
            let purchase = purchases[indexPath.row]
            cell.configure(purchase: purchase)
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let purchase = purchases[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) as? SpendingTableViewCell {
                        
            let vc = DetailViewController(delegate: self, placeholderText: navigationController?.description ?? "Enter Text Here")
            present(vc, animated: true, completion: nil)
            
        }
    }
}
