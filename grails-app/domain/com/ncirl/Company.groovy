package com.ncirl

class Company {

    String name
    String countryCode
    Set employees = []
    static hasMany = [employees: Employee]

    static constraints = {
        countryCode maxSize: 2
        name maxSize: 25
        employees nullable: true
    }
}

