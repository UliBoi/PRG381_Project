-- Drop existing users table if it exists
DROP TABLE IF EXISTS "users";

-- Create the users table
CREATE TABLE "users" (
    "studentNumber" VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Optional test data
INSERT INTO "users" ("studentNumber", name, surname, email, phone, password)
VALUES 
    ('1001', 'John', 'Doe', 'john.doe@example.com', '0712345678', 'hashed_password_here'),
    ('1002', 'Jane', 'Smith', 'jane.smith@example.com', '0723456789', 'hashed_password_here');
