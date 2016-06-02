//
//  SWPerson.swift
//  webrequest-test
//
//  Created by WangHaixin on 10/30/15.
//  Copyright © 2015 WangHaixin. All rights reserved.
//

import Foundation

class SWPerson
{
    private var _name :String!
    private var _height : String!
    private var _birthYear: String!
    private var _hairColor: String!
    
    var name:String
    {
        return  self._name
    }
    var height:String
        {
            return  self._height
    }
    var birthYear:String
        {
            return  self._birthYear
    }
    var hairColor:String
        {
            return  self._hairColor
    }
    
    
    

    init(name: String, height: String, birthYear: String, hairColor: String)
    {
        self._name = name
        self._height = height
        self._birthYear = birthYear
        self._hairColor = hairColor
    }
}