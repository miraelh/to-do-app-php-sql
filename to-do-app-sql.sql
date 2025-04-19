CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);


CREATE TABLE TodoLists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);


CREATE TABLE Tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_list_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    status ENUM('pending', 'done', 'in-progress') DEFAULT 'pending',
    due_date DATE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (todo_list_id) REFERENCES TodoLists(id) ON DELETE CASCADE
);



INSERT INTO users (username, email, password_hash)
VALUES 
    ('mira_fcs', 'mira@fcs.com', 'password_1'),
    ('amir_fcs', 'amir@fcs.com', 'password_2');
    
