# Student Wellness System – Milestone 1 (Web Version)

This is a Java-based web application developed for the **PRG381 module** at Belgium Campus. It focuses on implementing a student wellness portal using **JSP**, **Servlets**, and **PostgreSQL**. The application enables student registration, login, and dashboard interaction with secure session handling.

---

## Technologies Used

| Technology        | Description                            |
|-------------------|----------------------------------------|
| Java (JSP + Servlets) | Backend logic & web routing         |
| PostgreSQL         | Relational database for student data  |
| JDBC               | Database connectivity layer           |
| Apache Tomcat      | Web server for JSP & Servlets         |
| NetBeans           | IDE used to develop and run project   |
| GitHub             | Version control                       |

---

## Folder Structure (Milestone 1)
StudentWellnessSystem/
├── build/ # Compiled classes
├── dist/ # Project distribution
├── nbproject/ # NetBeans configuration
├── src/ # Java Servlets (e.g., LoginServlet.java)
├── web/ # JSP files (login.jsp, register.jsp, dashboard.jsp)
├── init_db.sql # SQL to initialize user table in PostgreSQL
├── postgresql-*.jar # JDBC driver for PostgreSQL
├── README.md # This file

---
## How to Run

1. Open the project in **NetBeans**.
2. Ensure PostgreSQL is running and database is created.
3. Run `init_db.sql` in **pgAdmin** to create the `users` table.
4. Add JDBC driver to project (`postgresql-*.jar`).
5. Deploy on **Apache Tomcat** via NetBeans.
6. Visit:
   - `http://localhost:8080/StudentWellnessSystem/register.jsp` to register
   - `http://localhost:8080/StudentWellnessSystem/login.jsp` to log in

---

## SQL Initialization Script

To create the required database structure, run the `init_db.sql` file in pgAdmin or the SQL tool.

## Security Features

- Passwords are hashed using SHA-256
- Validations on email format and phone input
- Session-based login control with dashboard access
- Redirection to `login.jsp` if not authenticated

---

## Notes

- Follows a basic **MVC** structure:  
  - Model: `User.java`  
  - View: `*.jsp`  
  - Controller: `*.Servlet` classes
- The application is lightweight and focused on core login + dashboard flow.
- Milestone 2 transitions the same concept into a **desktop Swing + JavaDB** version.

---

## Contributors
Group Member 1: Rodney Mlostshwa 600439 - JSP Frontend Developer

Group Member 2: Neo Polori 600508 - Register Servlet & Validation

Group Member 3: Gordon Mullin 600248 - Login Servlet & Session

Group Member 4: Ulrigh Oosthuizen 577952 - Database Engineer & Integration