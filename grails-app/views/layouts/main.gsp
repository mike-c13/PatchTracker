<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="PatchTracker"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.png" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header center">
            <asset:image src="navbar.png" alt="Patch Tracker"/>
        </div>
    </div>
    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <g:pageProperty name="page.nav"/>
        </ul>
    </div>
    <sec:ifLoggedIn>
        <div style="color: #FFFFFF;">
            User: <sec:username/>
        </div>
        &nbsp;&nbsp;
    <g:form controller="logout">
        <g:submitButton name="logout" value="Logout" class="btn-primary"/>
    </g:form>
    </sec:ifLoggedIn>
</nav>
<g:layoutBody/>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
<style>
.center {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 98%;
}
</style>
</html>
