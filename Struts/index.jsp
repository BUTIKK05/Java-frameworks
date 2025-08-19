<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>To-Do | Главная</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS & Icons (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: radial-gradient(1200px 600px at 10% 10%, #f0f8ff, #ffffff) fixed;
        }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-6">
            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-body p-4 p-lg-5 text-center">
                    <h1 class="fw-bold mb-3"><i class="bi bi-check2-square"></i> To-Do Список</h1>
                    <p class="text-muted mb-4">Лёгкое приложение на Struts2 для управления задачами.</p>
                    <a href="<s:url action='todos'/>" class="btn btn-primary btn-lg rounded-3">
                        Перейти к задачам <i class="bi bi-arrow-right ms-1"></i>
                    </a>
                </div>
            </div>
            <p class="text-center text-secondary mt-3 small">Powered by Apache Struts 2</p>
        </div>
    </div>
</div>
</body>
</html>
