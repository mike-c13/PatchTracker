package com.ncirl

import grails.gorm.services.Service

@Service(EmployeeDevices)
interface EmployeeDevicesService {

    EmployeeDevices get(Serializable id)

    List<EmployeeDevices> list(Map args)

    Long count()

    void delete(Serializable id)

    EmployeeDevices save(EmployeeDevices employeeDevices)

}