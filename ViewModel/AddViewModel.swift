//
//  AddViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 24/04/2021.


import Foundation

final class AddViewModel : NSObject {
    
    var categories = [CategoryObject]()
  override init() {
    let sport = CategoryObject(name: "sport", image: "sport")
    let book = CategoryObject(name: "book", image: "book")
    let tool = CategoryObject(name: "tool", image: "tool")
    let clothes = CategoryObject(name: "clothes", image: "clothes")
    let disque = CategoryObject(name: "disque", image: "disque")
    let makeUp = CategoryObject(name: "Make Up", image: "make_up")
    let money = CategoryObject(name: "money", image: "money")
    let plate = CategoryObject(name: "plate", image: "plate")
    let umbrella = CategoryObject(name: "umbrella", image: "umbrella")
    let usbKey = CategoryObject(name: "USB Key", image: "usb_key")
    let videoGames = CategoryObject(name: "Video Games", image: "video_games")
    
    categories.append(sport)
    categories.append(book)
    categories.append(tool)
    categories.append(clothes)
    categories.append(disque)
    categories.append(makeUp)
    categories.append(money)
    categories.append(plate)
    categories.append(umbrella)
    categories.append(usbKey)
    categories.append(videoGames)
 }
 func addloan(loan: Loan){
    
    CoreDataStack.addLoan(loan)
 }
}

