
function TaskManager() {
    this.tasks = [];
}

TaskManager.prototype.addTask = function(task) {
    this.tasks.append(task);
    console.log(task);
};

TaskManager.prototype.deleteTask = function(uid) {
    for (var i = 0; i < this.tasks.length; i++) {
        var task = this.tasks[i];
        if (task.uid == uid) {
            this.tasks.remove(task);
        }
    }
};

TaskManager.prototype.getTasks = function() {
    return this.tasks;
};

module.exports = TaskManager;