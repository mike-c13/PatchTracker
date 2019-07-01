package com.ncirl

class EmployeeDevices {

    String phone
    Date phonePatch
    String laptop
    Date laptopPatch
    String os

    static belongsTo = Employee

    static constraints = {
        phone()
        phone inList: ["iPhone", "Windows Phone", "Pixel"]
        phonePatch()
        laptop()
        laptop inList: ["ASUS", "MacBook", "Toshiba"]
        os()
        os inList: ["Windows 10", "iOS", "Ubuntu"]
        laptopPatch()
    }
}