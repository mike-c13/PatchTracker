package com.ncirl

class Employee {

    String name
    String email
    String position

    EmployeeDevices employeeDevices

    static belongsTo = [company: Company]

    static constraints = {
        name maxSize: 25
        email maxSize: 25
        position maxSize: 25
        name()
        position()
        email()
        email email: true
    }
}

