# PRG381_Project

# Student Wellness System (PRG381 Project)

This is a Java-based student wellness management system developed for the PRG381 module at Belgium Campus.

## Technologies Used

- **Java (JSP & Servlets)**
- **PostgreSQL** (Database)
- **JDBC** (Database Connectivity)
- **Apache NetBeans** (IDE)
- **Apache Tomcat** (Web Server)
- **GitHub** (Version Control)

## Group Member Role (Member 4 - Database Engineer & Integration)

- Designed and created the `users` table with:
  - `studentNumber`, `name`, `surname`, `email`, `phone`, `password`
- Added `NOT NULL` and `UNIQUE` constraints
- Created an SQL initialization script for teammates
- Connected PostgreSQL to Java servlets using JDBC
- Verified registration and login flow from frontend to backend

## Folder Structure
StudentWellnessSystem/
├── src/ # Java source code
├── web/ # JSP pages (register.jsp, login.jsp, dashboard.jsp)
├── nbproject/ # NetBeans project config
├── build/ # Ignored build files
├── README.md # Project overview

## How to Run

1. Open in NetBeans
2. Start Apache Tomcat
3. Open `register.jsp` in browser
4. Register a user, then log in via `login.jsp`

## SQL Initialization Script

See `init_db.sql` (if provided) to create and populate the `users` table.

## Notes

- Follows MVC architecture
- Passwords are hashed with SHA-256
- Session-based login with redirect to dashboard
