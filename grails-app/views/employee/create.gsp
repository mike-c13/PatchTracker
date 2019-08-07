<!DOCTYPE html>
<%@ page import="com.ncirl.Company" %>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-employee" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form useToken="true" resource="${this.employee}" method="POST">
                <fieldset class="form">
                    <f:field bean="employee" property="company">
                        <g:select name="company.id" from="${Company.list()}" optionKey="id" optionValue="name"/>
                    </f:field>
                    <f:field bean="employee" property="name"/>
                    <f:field bean="employee" property="position"/>
                    <f:field bean="employee" property="email"/>
                    <f:field bean="employee" property="employeeDevices.phone">
                        <g:select name="employeeDevices.phone" value="${value}" from="${['iPhone', 'Samsung', 'Pixel']}"/>
                    </f:field>
                    <f:field bean="employee" property="employeeDevices.phonePatch">
                        <g:field type="text" name="employeeDevices.phonePatch" id="updatePhone" value="${value}" class="pick"/>
                        <button id="phoneButton" type="button" class="btn btn-primary">Patch Phone!</button>
                    </f:field>
                    <f:field bean="employee" property="employeeDevices.laptop">
                        <g:select name="employeeDevices.laptop" value="${value}" from="${['ASUS', 'Macbook', 'Toshiba']}"/>
                    </f:field>
                    <f:field bean="employee" property="employeeDevices.os">
                        <g:select name="employeeDevices.os" value="${value}" from="${['Windows 10', 'iOS', 'Ubuntu']}"/>
                    </f:field>
                    <f:field bean="employee" property="employeeDevices.laptopPatch">
                        <g:field type="text" name="employeeDevices.laptopPatch" id="updateLaptop" value="${value}" class="pick"/>
                        <button id="laptopButton" type="button" class="btn btn-primary">Patch Laptop!</button>
                    </f:field>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
<style>
.btn{
    float: right;
}
</style>
</html>
