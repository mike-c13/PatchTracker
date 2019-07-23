package com.ncirl

class Company {

    String name
    String countryCode
    Set employees = []
    static hasMany = [employees: Employee]

    static constraints = {
        employees nullable: true
    }
}

