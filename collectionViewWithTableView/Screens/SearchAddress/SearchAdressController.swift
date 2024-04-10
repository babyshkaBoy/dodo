//
//  SearchDeliveryAdress.swift
//  collectionViewWithTableView
//
//  Created by Азамат Баев on 06.12.2023.
//

import UIKit
import SnapKit

enum SearchAddressSection: Int, CaseIterable {
    case searchAddress = 0
    case addressHint
}

class SearchAdressController: UIViewController {
    
    let addressArchiver = AddressArchiver()
    
    let dadataService = DadataService()
    
    var suggestAddresses: [SuggestAddress] = [] {
        didSet {
            //keyboard animation
            tableView.reloadData() //keyboard down
            
            if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SearchAddressCell {
                cell.searchAddressTextField.becomeFirstResponder()
            } //keyboard up
            
        }
     }
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        //tableView.allowsSelection = false // отключение тапа
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchAddressCell.self, forCellReuseIdentifier: SearchAddressCell.reuseId)
        tableView.register(AddressHintCell.self, forCellReuseIdentifier: AddressHintCell.reuseId)
        //tableView.separatorColor = .white
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
}


extension SearchAdressController {
    func setupViews() {
        view.addSubview(cancelButton)
        view.addSubview(tableView)
        view.backgroundColor = .white
    }
    func setupConstraints() {
        cancelButton.snp.makeConstraints { make in
            make.top.left.equalTo(view).inset(6)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.bottom).offset(14)
            make.left.right.bottom.equalTo(view)
        }
    }
}


//MARK: - UITableViewDelegate
extension SearchAdressController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        let suggestAddress = suggestAddresses[indexPath.row]
        
        addressArchiver.append(suggestAddress)
        
        dismiss(animated: true)
        
        //searchAddressFromSuggest(suggestAddress)
        
        

    }
}
//MARK: - UITableViewDataSource
extension SearchAdressController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SearchAddressSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sectionType = SearchAddressSection(rawValue: section) {
            switch sectionType {
                
            case .searchAddress:
                return 1
            case .addressHint:
                return suggestAddresses.count
                //default: return 0
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = SearchAddressSection(rawValue: indexPath.section)
        
        switch section {
        case .searchAddress:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchAddressCell.reuseId, for: indexPath) as! SearchAddressCell
            //cell.
            //cell.addNewAddressButton
            cell.selectionStyle = .none
            
            cell.onTextFieldChanged = { searchText in
                
                self.searchAddressSuggestFromDadata(searchText)
                //self.search
            }
            
            //cell.searchAddressTextField.tag = indexPath.row
            return cell
        case .addressHint:
            let cell = tableView.dequeueReusableCell(withIdentifier: AddressHintCell.reuseId, for: indexPath) as! AddressHintCell
            
            let address = suggestAddresses[indexPath.row]
            
            cell.update(address)
            
            cell.selectionStyle = .none

            return cell
        default: return UITableViewCell()
        }
    }
}

//MARK: - Business Logic
extension SearchAdressController {
    
//    func searchAddressFromSuggest(_ suggest: SuggestAddress) {
//
////        dadataService.getAddress(query: suggest.value) { addressResponse in
////
////            print("->", addressResponse)
////
////
////
////
////        }
//    }
    
    func searchAddressSuggestFromDadata(_ searchText: String) {
        
        dadataService.getSuggestions(city: searchText) { [weak self] addresses in
            
            DispatchQueue.main.async {
                guard let self else {return}
                //self.update(addresses: data)
                                self.suggestAddresses = addresses
                
//                var indexPaths: [IndexPath] = []
//
//                for (index, _) in self.suggestAddresses.enumerated() {
//
//                    let indexPath = IndexPath(row:index, section:1)
//                    print(index, indexPath)
//                    //indexPaths.append(indexPath)
//                    //self.tableView.reloadRows(at: [indexPath], with: .fade)
//                    self.tableView.beginUpdates()
//                    self.tableView.insertRows(at: [indexPath], with: .none)
//                    self.tableView.endUpdates()
                }
//                //self.tableView.reloadRows(at: indexPaths, with: .fade) // you can provide multiple indexPaths at once in the array.
            }
        
    }
}


