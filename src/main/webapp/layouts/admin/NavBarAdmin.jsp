<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="w3-sidebar w3-bar-block w3-collapse w3-card w3-animate-left" style="width:230px;" id="mySidebar">
    <button class="w3-bar-item w3-button w3-large w3-hide-large btn-sidebar" onclick="w3_close()">
        <i class="fas fa-times"></i>
    </button>
    <div class="top-menu-bar">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="logoImg">
                <img src=".././images/iconHorizon.png" class="logo_image" alt="Horizon Logo" />
            </a>
            <div>Horizon</div>
        </div>
        <div class="close" id="close-btn">
            <i class="uil uil-times"></i>
        </div>
    </div>
    <div class="sidebar">
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-link active">
            <i class="uil uil-grid"></i>
            <h4>Dashboard</h4>
        </a>
        <a href="${pageContext.request.contextPath}/admin/user-management" class="sidebar-link">
            <i class="uil uil-user"></i>
            <h4>Users</h4>
        </a>
        <a href="${pageContext.request.contextPath}/admin/product-management" class="sidebar-link">
            <i class="uil uil-clipboard-notes"></i>
            <h4>Products</h4>
        </a>
        <div class="sidebar-link setting-btn">
            <i class="uil uil-setting"></i>
            <h4>Settings</h4>
            <span class="fas fa-caret-down setting"></span>
        </div>
        <ul class="setting-show">
            <li>
                <a href="${pageContext.request.contextPath}/admin/info-profile" class="sidebar-link">
                    <i class="uil uil-user"></i>
                    My Profile
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/edit-profile" class="sidebar-link">
                    <i class="uil uil-edit"></i>
                    Edit Profile
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/change-password" class="sidebar-link">
                    <i class="uil uil-padlock"></i>
                    Change Password
                </a>
            </li>
        </ul>
        <a href="${pageContext.request.contextPath}/admin/add-product" class="sidebar-link">
            <i class="uil uil-plus-circle"></i>
            <h4>Add Product</h4>
        </a>
        <a href="${pageContext.request.contextPath}/logout">
            <i class="uil uil-signout"></i>
            <h4>Logout</h4>
        </a>
    </div>
</div>