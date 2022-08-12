<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="w3-container">
    <div class="management-top">
        <div class="admin-profile">
            <div class="profile-content">
                <div class="info">
                    <p>Hey, <b>${sessionScope.LOGIN_ADMIN.userName}</b></p>
                    <small class="text-mutedd">Admin</small>
                </div>
                <c:if test="${sessionScope.LOGIN_ADMIN.imageAvatar == null}">
                    <div class="profile-default" style="background: ${sessionScope.LOGIN_ADMIN.colorAvatar}">
                        <p>${sessionScope.LOGIN_ADMIN.defaultAvatar.toUpperCase()}</p>
                    </div>
                </c:if>
                <c:if test="${sessionScope.LOGIN_ADMIN.imageAvatar != null}">
                    <div class="profile-default">
                        <img src="data:image/png;base64,${sessionScope.LOGIN_ADMIN.imageAvatar}" alt="${sessionScope.LOGIN_ADMIN.userName}">
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>