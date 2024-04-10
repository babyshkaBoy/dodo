//
//  AdressDeliveryController.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 05.12.2023.
//

import UIKit
import SnapKit

enum DeliveryAddressSection: Int, CaseIterable {
    case address = 0
    case addAddress
}

class DeliveryAddressController: UIViewController {
    
    //var onAddNewAddressTapped: (()->())?
    
    var addressArchiver = AddressArchiver()
    
    var suggestAddress: [SuggestAddress] = [] {
        didSet {
            tableView.reloadData()
        }
        
    }
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        return button
    }()
    
    private let deliveryAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адрес доставки"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        //tableView.allowsSelection = false // отключение тапа
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AddNewAddressCell.self, forCellReuseIdentifier: AddNewAddressCell.reuseId)
        tableView.register(AddressCell.self, forCellReuseIdentifier: AddressCell.reuseId)
        //tableView.separatorColor = .white
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        
        fetchAddressesFromArchiver()
    }
    
    func fetchAddressesFromArchiver()  {
       suggestAddress = addressArchiver.retrieve()
    }
    
}

//MARK: - Layout
extension DeliveryAddressController {
    private func setupViews() {
        view.addSubview(cancelButton)
        view.addSubview(deliveryAddressLabel)
        view.addSubview(tableView)
        view.backgroundColor = .white
        
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(deliveryAddressLabel.snp.bottom).offset(14)
            make.left.right.bottom.equalTo(view)
        }
        deliveryAddressLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).inset(5)
        }
        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(view).inset(4)
            make.right.equalTo(deliveryAddressLabel.snp.left).inset(8)
            
        }
    }
}
//MARK: - UITableViewDelegate
extension DeliveryAddressController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let sectionType = DeliveryAddressSection(rawValue: indexPath.section) {
            
            switch sectionType {
            case .address:
                
                let address = suggestAddress[indexPath.row]
                
                var array = suggestAddress
                
                array.removeAll { $0.value == address.value }
                
                array.insert(address, at: 0)
                
                addressArchiver.save(array)
                
                suggestAddress = addressArchiver.retrieve()
                
                
            case .addAddress:
                break
            }
            
           
            //tableView.reloadData()
        }
    }
}
//MARK: - UITableViewDataSource
extension DeliveryAddressController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DeliveryAddressSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sectionType = DeliveryAddressSection(rawValue: section) {
            switch sectionType {
            case .address:
                return suggestAddress.count
            case .addAddress:
                return 1
            }
        }
        
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DeliveryAddressSection(rawValue: indexPath.section)
        switch section {
        case .address:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.reuseId, for: indexPath) as! AddressCell
            
            let address = suggestAddress[indexPath.row]
            cell.update(address)
           
            
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            return cell
            
            
        case .addAddress:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddNewAddressCell.reuseId, for: indexPath) as! AddNewAddressCell
            cell.onAddNewAddressTapped = {
                let searchAddressController = SearchAdressController()
                self.present(searchAddressController, animated: true)
            }
            //cell.addNewAddressButton
            return cell
        default: return UITableViewCell()
        }
        
        
    }
}

