package mobilereg

import com.ncirl.Company
import com.ncirl.Employee
import com.ncirl.EmployeeDevices
import com.ncirl.Role
import com.ncirl.User
import com.ncirl.UserRole

class BootStrap {

    def init = { servletContext ->
        def google = new Company(name: 'Google', countryCode: 'US').save()
        def microsoft = new Company(name: 'Microsoft', countryCode: 'US').save()
        def apple = new Company(name: 'Apple', countryCode: 'US').save()

        def pattern = "dd/MM/yyyy"
        def date1s = "13/10/2018"
        def date2s = "15/04/2019"

        def date1 = Date.parse(pattern, date1s)
        def date2 = Date.parse(pattern, date2s)

        def deviceConfig1 = new EmployeeDevices(phone: 'Pixel', phonePatch: date1, laptop: 'ASUS', laptopPatch: date2, os: 'Ubuntu').save(failOnError: true)
        def deviceConfig2 = new EmployeeDevices(phone: 'Windows Phone', phonePatch: date1, laptop: 'Toshiba', laptopPatch: date2, os: 'Windows 10').save(failOnError: true)
        def deviceConfig3 = new EmployeeDevices(phone: 'iPhone', phonePatch: date1, laptop: 'MacBook', laptopPatch: date2, os: 'iOS').save(failOnError: true)

        new Employee(name: 'Dave', email: 'dave@google.com', position: 'CEO', company: google, employeeDevices: deviceConfig1).save(failOnError: true)
        new Employee(name: 'Steve', email: 'steve@google.com', position: 'CTO', company: google, employeeDevices: deviceConfig1).save(failOnError: true)
        new Employee(name: 'Mary', email: 'mary@microsoft.com', position: 'CEO', company: microsoft, employeeDevices: deviceConfig2).save(failOnError: true)
        new Employee(name: 'Gerry', email: 'gerry@microsoft.com', position: 'CTO', company: microsoft, employeeDevices: deviceConfig2).save(failOnError: true)
        new Employee(name: 'John', email: 'john@apple.com', position: 'CEO', company: apple, employeeDevices: deviceConfig3).save(failOnError: true)
        new Employee(name: 'Karen', email: 'karen@apple.com', position: 'CTO', company: apple, employeeDevices: deviceConfig3).save(failOnError: true)

        def authorities = ['ROLE_USER']
        authorities.each {
            if ( !Role.findByAuthority(it) ) {
                new Role(authority: it).save()
            }
        }
        if ( !User.findByUsername('mike') ) {
            def u = new User(username: 'mike', password: 'password')
            u.save()
            def ur = new UserRole(user: u, role: Role.findByAuthority('ROLE_USER'))
            ur.save()
        }

        def authoritiesAdmin = ['ROLE_ADMIN']
        authoritiesAdmin.each {
            if ( !Role.findByAuthority(it) ) {
                new Role(authority: it).save()
            }
        }
        if ( !User.findByUsername('admin') ) {
            def u = new User(username: 'admin', password: 'password')
            u.save()
            def ur = new UserRole(user: u, role: Role.findByAuthority('ROLE_ADMIN'))
            ur.save()
        }
    }
    def destroy = {
    }
}
