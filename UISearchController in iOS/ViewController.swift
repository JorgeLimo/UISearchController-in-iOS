//
//  ViewController.swift
//  UISearchController in iOS
//
//  Created by Alumno on 7/03/17.
//  Copyright © 2017 JorgeLimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {

    @IBOutlet weak var table: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var dispositivios = Array<Dispositivo>()
    var dispositiviosFiltrados = Array<Dispositivo>()
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let texto = searchController.searchBar.text
        
        dispositiviosFiltrados = dispositivios.filter({ (dispositivo) -> Bool in
            return String(dispositivo.precio).lowercased().contains(texto!.lowercased()) || dispositivo.fabricacion.lowercased().contains(texto!.lowercased()) || dispositivo.nombre.lowercased().contains(texto!.lowercased())
        })
        table.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchController.searchBar.placeholder = "Busqueda"
        searchController.searchBar.prompt = "Titulo"
        searchController.searchResultsUpdater = self
        table.tableHeaderView = searchController.searchBar
        
        for i in 1...9{
            
            let dispo = Dispositivo()
         
            switch i {
            case 1:
                dispo.nombre = "iPhone"
                dispo.precio = 599.00
                dispo.fabricacion = "2017"
            case 2:
                dispo.nombre = "iPod"
                dispo.precio = 399.00
                dispo.fabricacion = "2016"
            case 3:
                dispo.nombre = "iPod Touch"
                dispo.precio = 210.00
                dispo.fabricacion = "2017"
            case 4:
                dispo.nombre = "iPad"
                dispo.precio = 499.00
                dispo.fabricacion = "2015"
            case 5:
                dispo.nombre = "iPad Mini"
                dispo.precio = 659.00
                dispo.fabricacion = "2016"
            case 6:
                dispo.nombre = "Mac"
                dispo.precio = 1299.00
                dispo.fabricacion = "2015"
            case 7:
                dispo.nombre = "Mac Pro"
                dispo.precio = 2499.00
                dispo.fabricacion = "2007"
            case 8:
                dispo.nombre = "MacBook Air"
                dispo.precio = 1799.00
                dispo.fabricacion = "2007"
            default:
                dispo.nombre = "MacBook Pro"
                dispo.precio = 1499.00
                dispo.fabricacion = "2007"
            }
            
            dispositivios.append(dispo)
            
        }
        
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        if  searchController.isActive && searchController.searchBar.text != "" {
            return dispositiviosFiltrados.count
        }
        
        return dispositivios.count
    
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for : indexPath)

        let item:Dispositivo
        
        if  searchController.isActive && searchController.searchBar.text != "" {
            item = dispositiviosFiltrados[indexPath.row]
        }else{
            item = dispositivios[indexPath.row]
        }
        
 
        cell.textLabel?.text = item.nombre!
        cell.detailTextLabel?.text = "$\(item.precio!) | \(item.fabricacion!)"
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

