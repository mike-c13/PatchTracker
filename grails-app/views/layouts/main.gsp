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
<nav class="navbar navbar-expand-lg navbar-dark static-top">
    <div class="container">
        <a class="navbar-brand" href="/#">
            <asset:image src="navbar.png" alt="Patch Tracker" class="img-fluid"/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/#">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="employee" action="create">New Employee</g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="company" action="create">New Company</g:link>
                </li>
                <li class="nav-item" style="padding-right: 10px">
                    <a class="nav-link" href="#" data-toggle="popover" data-html="true" data-placement="bottom"
                       data-content="Mike Colgan<br /> XXXXXXX@hotmail.com">Contact</a>
                </li>
            </ul>
            <div class="form-inline my-2 my-lg-0">
                <sec:ifNotLoggedIn>
                    <g:form controller="login">
                        <g:submitButton name="login" value="Login" class="btn-primary"/>
                    </g:form>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <div class="user">
                        <span style="text-decoration: underline; font-weight: bold;">User:</span> <sec:username/>
                    </div>
                    <g:form controller="logout">
                        <g:submitButton name="logout" value="Logout" class="btn-primary"/>
                    </g:form>
                </sec:ifLoggedIn>
            </div>
        </div>
    </div>
</nav>
<g:layoutBody/>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>
<script>
    $(function () {
        $('[data-toggle="popover"]').popover({
            trigger: 'hover'
        })
    });
</script>
</body>
</html>
