package com.ncirl

class Employee {

    String name
    String email
    String position

    EmployeeDevices employeeDevices

    static belongsTo = [company: Company]

    static constraints = {
        name()
        position()
        email()
        email email: true
    }
}

