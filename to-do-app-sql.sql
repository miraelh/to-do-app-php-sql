CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);


CREATE TABLE TodoLists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (User_id) REFERENCES Users(id) ON DELETE CASCADE
);


CREATE TABLE Tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    TodoList_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    status ENUM('pending', 'done', 'in-progress') DEFAULT 'pending',
    due_date DATE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TodoList_id) REFERENCES TodoLists(id) ON DELETE CASCADE
);



INSERT INTO Users (username, email, password_hash)
VALUES 
    ('mira_fcs', 'mira@fcs.com', 'password_1'),
    ('amir_fcs', 'amir@fcs.com', 'password_2');

INSERT INTO TodoLists (User_id, name)
VALUES
    (1, 'Mira\'s Tasks'),
    (2, 'Amir\'s Personal Tasks');


INSERT INTO Tasks (TodoList_id, title, status, due_date)
VALUES 
    (1, 'Buy groceries', 'pending', '2024-04-15'),
    (1, 'Submit report', 'done', '2024-04-10'),
    (1, 'Go jogging', 'pending', '2024-04-12'),
    (1, 'Book flight', 'done', '2024-04-08');


SELECT * FROM Tasks
WHERE status = 'pending';


SELECT * FROM Tasks
WHERE TodoList_id = 1;


UPDATE Tasks
SET status = 'done'
WHERE id = 1;


DELETE FROM Tasks
WHERE id = 2;