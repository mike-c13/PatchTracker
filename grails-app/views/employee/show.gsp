<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-employee" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list">
            <f:display bean="employee" property="name"/><br>
            <f:display bean="employee" property="position"/><br>
            <f:display bean="employee" property="email"/><br>
            <f:display bean="employee" property="employeeDevices.phone"/><br>
            <f:display bean="employee" property="employeeDevices.phonePatch">
                <g:formatDate format="dd/MM/yyyy" date="${value}"/>
            </f:display><br>
            <f:display bean="employee" property="employeeDevices.laptop"/><br>
            <f:display bean="employee" property="employeeDevices.os"/><br>
            <f:display bean="employee" property="employeeDevices.laptopPatch">
                <g:formatDate format="dd/MM/yyyy" date="${value}"/>
            </f:display>
            </ol>
            <g:form useToken="true" resource="${this.employee}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.employee}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
