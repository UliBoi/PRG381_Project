package app;

public class Student {
    private String student_number;
    private String name;
    private String surname;
    private String email;
    private String phone;
    private String password;

    // Constructor
    public Student(String student_number, String name, String surname, String email, String phone, String password) {
        this.student_number = student_number;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    // Getters
    public String getStudentNumber() { return student_number; }
    public String getName() { return name; }
    public String getSurname() { return surname; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getPassword() { return password; }

    // Setters
    public void setPassword(String password) { this.password = password; }
}
