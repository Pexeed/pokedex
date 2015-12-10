//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by daniel on 10/12/15.
//  Copyright © 2015 pexed. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var titleNameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeEvoImage: UIImageView!
    @IBOutlet weak var evolutionImage: UIImageView!
    @IBOutlet weak var evolutionLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleNameLbl.text = pokemon.name.capitalizedString
        pokeImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokeEvoImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done
            print("CHEGOU AQUIII")
            self.updateUI()
        }
    }
    
    func updateUI() {
        descLbl.text = pokemon.desc
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        if(pokemon.nextEvoId == ""){
            evolutionLbl.text = "No Evolutions"
            evolutionImage.hidden = true
        }else{
            evolutionImage.image = UIImage(named: "\(pokemon.nextEvoId)")
            evolutionImage.hidden = false
            
            var evoStr = "Next Evolution: \(pokemon.nextEvoName)"
            
            if pokemon.nextEvoLvl != "" {
                evoStr += " - LVL \(pokemon.nextEvoLvl)"
            }
            
            evolutionLbl.text = evoStr
            
        }
    }

    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
