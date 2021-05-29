//
//  AddViewModel.swift
//  Borrowlaend
//
//  Created by Emile Pedarros on 24/04/2021.


import Foundation

final class AddViewModel : NSObject {
    
    var categories = [Category]()
  override init() {
    let sport = Category(name: "sport", image: "sport")
    let book = Category(name: "book", image: "book")
    let tool = Category(name: "tool", image: "tool")
    let clothes = Category(name: "clothes", image: "clothes")
    let disque = Category(name: "disque", image: "disque")
    let makeUp = Category(name: "Make Up", image: "make_up")
    let money = Category(name: "money", image: "money")
    let plate = Category(name: "plate", image: "plate")
    let umbrella = Category(name: "umbrella", image: "umbrella")
    let usbKey = Category(name: "USB Key", image: "usb_key")
    let videoGames = Category(name: "Video Games", image: "video_games")
    
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

