<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>To-Do | Задачи</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { background-color: #f6f8fb; }
        .glass {
            background: rgba(255,255,255,0.75);
            backdrop-filter: blur(8px);
        }
        .strike { text-decoration: line-through; opacity: .6; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-semibold" href="<s:url value='/'/>">
            <i class="bi bi-check2-square me-1"></i> To-Do
        </a>
    </div>
</nav>

<div class="container my-4">
    <!-- Сообщения -->
    <s:if test="hasActionMessages()">
        <div class="alert alert-success rounded-3">
            <ul class="mb-0">
                <s:actionmessage/>
            </ul>
        </div>
    </s:if>
    <s:if test="hasActionErrors()">
        <div class="alert alert-danger rounded-3">
            <ul class="mb-0">
                <s:actionerror/>
            </ul>
        </div>
    </s:if>

    <div class="row g-4">
        <div class="col-lg-7">
            <div class="card glass border-0 shadow-sm rounded-4">
                <div class="card-header bg-transparent border-0 pt-4">
                    <h4 class="mb-0">Ваши задачи</h4>
                </div>
                <div class="card-body">
                    <s:if test="todos.size() == 0">
                        <p class="text-secondary mb-0">Список пуст — добавьте первую задачу ниже.</p>
                    </s:if>

                    <s:else>
                        <ul class="list-group list-group-flush">
                            <s:iterator value="todos" status="st">
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center gap-3">
                                        <span class="badge text-bg-secondary rounded-pill"><s:property value="#st.index + 1"/></span>
                                        <span><s:property/></span>
                                    </div>
                                    <div>
                                        <s:url id="delUrl" action="todos/delete">
                                            <s:param name="index" value="%{#st.index}"/>
                                        </s:url>
                                        <a href="%{delUrl}" class="btn btn-outline-danger btn-sm rounded-3">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </div>
                                </li>
                            </s:iterator>
                        </ul>
                    </s:else>
                </div>
                <div class="card-footer bg-transparent border-0 pb-4">
                    <a href="<s:url action='todos/clear'/>" class="btn btn-outline-secondary btn-sm rounded-3"
                       onclick="return confirm('Очистить все задачи?');">
                        Очистить все
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="card glass border-0 shadow-sm rounded-4">
                <div class="card-header bg-transparent border-0 pt-4">
                    <h5 class="mb-0">Добавить задачу</h5>
                </div>
                <div class="card-body">
                    <s:form action="todos/add" theme="simple" cssClass="row gy-3">
                        <div class="col-12">
                            <label class="form-label">Текст задачи</label>
                            <s:textfield name="item" cssClass="form-control form-control-lg rounded-3"
                                         placeholder="Например: Позвонить клиенту в 15:00"/>
                        </div>
                        <div class="col-12 d-grid">
                            <button type="submit" class="btn btn-primary btn-lg rounded-3">
                                <i class="bi bi-plus-lg me-1"></i> Добавить
                            </button>
                        </div>
                    </s:form>
                </div>
                <div class="card-footer bg-transparent border-0 pb-4 small text-secondary">
                    Советы: добавляйте короткие, конкретные задачи. Удаляйте выполненные.
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (по желанию) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
