package com.ncirl

import grails.databinding.BindingFormat

class EmployeeDevices {

    String phone
    @BindingFormat('dd/MM/yyyy')
    Date phonePatch
    String laptop
    @BindingFormat('dd/MM/yyyy')
    Date laptopPatch
    String os

    static belongsTo = Employee

    static constraints = {
        phone()
        phone inList: ["iPhone", "Samsung", "Pixel"]
        phonePatch()
        laptop()
        laptop inList: ["ASUS", "MacBook", "Toshiba"]
        os()
        os inList: ["Windows 10", "iOS", "Ubuntu"]
        laptopPatch()
    }
}