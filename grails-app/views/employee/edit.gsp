<!DOCTYPE html>
<%@ page import="com.ncirl.Company" %>

<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-employee" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.employee}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.employee}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.employee}" method="PUT">
                <g:hiddenField name="version" value="${this.employee?.version}" />
                <fieldset class="form">
                    <f:field bean="employee" property="company">
                        <g:select name="company.id" from="${Company.list()}" optionKey="id" optionValue="name"/>
                    </f:field>
                    <f:field bean="employee" property="name"/>
                    <f:field bean="employee" property="position"/>
                    <f:field bean="employee" property="email"/>
                    <f:field bean="employee" property="employeeDevices.phone">
                        <g:select name="employeeDevices.phone" from="${['iPhone', 'Samsung', 'Pixel']}"/>
                    </f:field>
                    <f:field bean="employee" property="employeeDevices.phonePatch" id="p"/>
                    <f:field bean="employee" property="employeeDevices.laptop">
                        <g:select name="employeeDevices.laptop" from="${['ASUS', 'Macbook', 'Toshiba']}"/>
                    </f:field>
                    <f:field bean="employee" property="employeeDevices.os">
                        <g:select name="employeeDevices.os" from="${['Windows 10', 'iOS', 'Ubuntu']}"/>
                    </f:field>
                    <f:field bean="employee" property="employeeDevices.laptopPatch" id="l"/>
                </fieldset>
                <input type="button" id="p1" value="phone"/>
                <input type="button" id="p2" value="laptop"/>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    <script type="text/javascript">
    </script>

    </body>
</html>

