package com.ncirl

class Company {

    String name
    String countryCode

    static hasMany = [employees: Employee]

    static constraints = {

    }
}

