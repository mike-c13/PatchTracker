package com.ncirl

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class EmployeeDevicesController {

    EmployeeDevicesService employeeDevicesService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond employeeDevicesService.list(params), model:[employeeDevicesCount: employeeDevicesService.count()]
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def show(Long id) {
        respond employeeDevicesService.get(id)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def create() {
        respond new EmployeeDevices(params)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def save(EmployeeDevices employeeDevices) {

        withForm {
            log.info "successful employeedevice save - " + principal.username
        }.invalidToken {
            message(error: "Double submit error")
        }

        if (employeeDevices == null) {
            notFound()
            return
        }

        try {
            employeeDevicesService.save(employeeDevices)
        } catch (ValidationException e) {
            respond employeeDevices.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'employeeDevices.label', default: 'EmployeeDevices'), employeeDevices.id])
                redirect employeeDevices
            }
            '*' { respond employeeDevices, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def edit(Long id) {
        respond employeeDevicesService.get(id)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def update(EmployeeDevices employeeDevices) {

        withForm {
            log.info "successful employeedevice update - " + principal.username
        }.invalidToken {
            message(error: "Double submit error")
        }

        if (employeeDevices == null) {
            notFound()
            return
        }

        try {
            employeeDevicesService.save(employeeDevices)
        } catch (ValidationException e) {
            respond employeeDevices.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'employeeDevices.label', default: 'EmployeeDevices'), employeeDevices.id])
                redirect employeeDevices
            }
            '*'{ respond employeeDevices, [status: OK] }
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def delete(Long id) {

        withForm {
            log.info "successful employeedevice delete - " + principal.username
        }.invalidToken {
            message(error: "Double submit error")
        }

        if (id == null) {
            notFound()
            return
        }

        employeeDevicesService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'employeeDevices.label', default: 'EmployeeDevices'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeDevices.label', default: 'EmployeeDevices'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
