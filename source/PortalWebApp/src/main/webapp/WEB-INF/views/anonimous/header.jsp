<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header logo: style can be found in header.less -->
<header class="header-lte">
    <a onclick="getHome()" class="logo">
        <!-- Add the class icon to your logo image or logo icon to add the margining -->
        <!--  <img src="<c:url value='/resources/css/img/Logo-Mega-CH-white.png' />" class="img-logo" alt="User Image"/> -->
        LOGO
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <div class="navbar-right">
            <ul class="nav navbar-nav">
            	<li class="dropdown messages-menu">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                    <i class="glyphicon glyphicon-user"></i>
	                </a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <!-- inner menu: contains the actual data -->
	                        <ul class="menu">
	                            <li><!-- start message -->
	                                <a href="#" onclick="showLogin();">
	                                    <h4>
	                                        Login
	                                    </h4>
	                                </a>
	                            </li><!-- end message -->
	                            <li>
	                                <a href="#" onclick="showRegistro();">
	                                    <h4>
	                                        Registro
	                                    </h4>
	                                </a>
	                            </li>
	                        </ul>
	                    </li>
	                </ul>
	            </li>
            </ul>
            
        </div>
    </nav>
</header>
