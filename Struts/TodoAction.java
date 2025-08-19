package org.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Простой To-Do список в сессии пользователя.
 * Методы:
 *  - execute(): показать список
 *  - add(): добавить элемент
 *  - delete(): удалить по индексу
 *  - clearAll(): очистить список
 */
public class TodoAction extends ActionSupport implements SessionAware {

    private static final String SESSION_KEY = "todos";

    private Map<String, Object> session;
    private String item;   // новая задача из формы
    private Integer index; // индекс для удаления

    public String execute() {
        ensureListExists();
        return SUCCESS;
    }

    public String add() {
        ensureListExists();
        if (item == null || item.trim().isEmpty()) {
            addActionError("Введите текст задачи.");
            return INPUT;
        }
        @SuppressWarnings("unchecked")
        List<String> todos = (List<String>) session.get(SESSION_KEY);
        todos.add(item.trim());
        addActionMessage("Задача добавлена.");
        item = null;
        return SUCCESS;
    }

    public String delete() {
        ensureListExists();
        if (index == null) {
            addActionError("Не передан индекс для удаления.");
            return INPUT;
        }
        @SuppressWarnings("unchecked")
        List<String> todos = (List<String>) session.get(SESSION_KEY);
        if (index >= 0 && index < todos.size()) {
            todos.remove((int) index);
            addActionMessage("Задача удалена.");
        } else {
            addActionError("Некорректный индекс задачи.");
            return INPUT;
        }
        return SUCCESS;
    }

    public String clearAll() {
        ensureListExists();
        @SuppressWarnings("unchecked")
        List<String> todos = (List<String>) session.get(SESSION_KEY);
        todos.clear();
        addActionMessage("Список очищен.");
        return SUCCESS;
    }

    private void ensureListExists() {
        if (!session.containsKey(SESSION_KEY)) {
            session.put(SESSION_KEY, new ArrayList<String>());
        }
    }

    @SuppressWarnings("unchecked")
    public List<String> getTodos() {
        ensureListExists();
        return (List<String>) session.get(SESSION_KEY);
    }

    // --- Getters/Setters & SessionAware ---
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public String getItem() { return item; }
    public void setItem(String item) { this.item = item; }

    public Integer getIndex() { return index; }
    public void setIndex(Integer index) { this.index = index; }
}
