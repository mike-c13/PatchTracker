package com.ncirl

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class EmployeeDevicesServiceSpec extends Specification {

    EmployeeDevicesService employeeDevicesService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new EmployeeDevices(...).save(flush: true, failOnError: true)
        //new EmployeeDevices(...).save(flush: true, failOnError: true)
        //EmployeeDevices employeeDevices = new EmployeeDevices(...).save(flush: true, failOnError: true)
        //new EmployeeDevices(...).save(flush: true, failOnError: true)
        //new EmployeeDevices(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //employeeDevices.id
    }

    void "test get"() {
        setupData()

        expect:
        employeeDevicesService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<EmployeeDevices> employeeDevicesList = employeeDevicesService.list(max: 2, offset: 2)

        then:
        employeeDevicesList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        employeeDevicesService.count() == 5
    }

    void "test delete"() {
        Long employeeDevicesId = setupData()

        expect:
        employeeDevicesService.count() == 5

        when:
        employeeDevicesService.delete(employeeDevicesId)
        sessionFactory.currentSession.flush()

        then:
        employeeDevicesService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        EmployeeDevices employeeDevices = new EmployeeDevices()
        employeeDevicesService.save(employeeDevices)

        then:
        employeeDevices.id != null
    }
}
