
function TaskManager() {
    self.tasks = [];
}

TaskManager.prototype.addTask = function(task) {
    self.tasks.append(task);
};

TaskManager.prototype.deleteTask = function(uid) {
    for (var i = 0; i < self.tasks.length; i++) {
        var task = self.tasks[i];
        if (task.uid == uid) {
            self.tasks.remove(task);
        }
    }
};

TaskManager.prototype.getTasks = function() {
    return self.tasks;
};

module.exports = TaskManager;