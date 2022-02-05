//
//  Test1ViewController.swift
//  DesignReferences
//
//  Created by Lily Pham on 2/2/22.
//  Push

import UIKit

class Test1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? PalettesTableViewCell {
            let color = colors[indexPath.row]
            cell.configure(color: color)
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) as? PalettesTableViewCell {
            let color = getRandomColor()
            view.addSubview(tableView)
        }
    }
    
    
    var tableView = UITableView()
    var colors: [UIColor] = [.red, .black, .lightGray, .white]
    
    let reuseIdentifier = "colorsCellReuse"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        colors = [getRandomColor(),getRandomColor(),getRandomColor(),getRandomColor()]
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PalettesTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
//        Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    

}
