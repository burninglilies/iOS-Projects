//
//  Test2ViewController.swift
//  DesignReferences
//
//  Created by Lily Pham on 2/4/22.
//

import UIKit

class Test2ViewController: UIViewController {
    
    private var button = UIButton()
    private var collectionView: UICollectionView!
    private let shapeCellReuseIdentifier = "shapeCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifer"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(button)
        
        //CollectionView Code
        //collectionView.dataSource = self
        colors = [Color(colorString: "", paletteColor: getRandomColor()), Color(colorString: "", paletteColor: getRandomColor()), Color(colorString: "", paletteColor: getRandomColor()), Color(colorString: "", paletteColor: getRandomColor())]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let dataSource: [UIColor] = [getRandomColor(),getRandomColor(),getRandomColor(),getRandomColor()]

        // TODO 3: Create collection view cell and register it here.
        collectionView.register(PalettesCollectionViewCell.self, forCellWithReuseIdentifier: "colorCellReuseIdentifier")

        // TODO 4: Set collection view data source
        //collectionView.dataSource = self

        // TODO 5: Set collection view delegate
        //collectionView.delegate = self

        // TODO 6: Register header view
        //collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        view.addSubview(collectionView)
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 32)
        ])
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
    
    @objc func dismissViewController() {
        // TODO 9: call delegate function
        //delegate?.updateTitle(newString: textField.text ?? "view controllers")
        // TODO 5: dismiss view controller
        dismiss(animated: true, completion: nil)
    }
    
    //CollectionView DataSource Conform
    

    //Functions to create random colors
    
    
}


private var colors: [Color] = [Color(colorString: "abc", paletteColor: .blue), Color(colorString: "abc", paletteColor: .blue), Color(colorString: "abc", paletteColor: .blue), Color(colorString: "abc", paletteColor: .blue)]


extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shapeCellReuseIdentifier", for: indexPath) as! PalettesCollectionViewCell
        let color = colors[indexPath.item]
        cell.configure(for: color)
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderView
//        let section = sections[indexPath.section]
//        header.configure(for: section)
//        return header
//    }

}

// TODO 5: Confrom to UICollectionViewDelegateFlowLayout
// TODO 7: Conform to UICollectionViewDelegate, implement interaction
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numItemsPerRow: CGFloat = 2.0
        let size = (collectionView.frame.width - 5) / numItemsPerRow
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        colors[indexPath.item].paletteColor = getRandomColor()
        collectionView.reloadData()
    }

}

func getRandomColor() -> UIColor {
     //Generate between 0 to 1
     let red:CGFloat = CGFloat(drand48())
     let green:CGFloat = CGFloat(drand48())
     let blue:CGFloat = CGFloat(drand48())

     return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
}
