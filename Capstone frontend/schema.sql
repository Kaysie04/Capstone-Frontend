CREATE TABLE NewHire (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
password varchar(50) NOT NULL,
job_title varchar(50) NOT NULL,
Salary varchar(50) NOT NULL
);

CREATE TABLE Address (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
street varchar(50) NOT NULL,
city varchar(50) NOT NULL,
state varchar(50) NOT NULL,
zipcode varchar(50) NOT NULL,
phone_number varchar(50) NOT NULL
);

CREATE TABLE Manager (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(50) NOT NULL
);

CREATE TABLE Dept(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(50) NOT NULL
);

CREATE TABLE Admin (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(50) NOT NULL,
email varchar(50) NOT NULL UNIQUE,
password varchar(50) NOT NULL
);



INSERT INTO Dept (name) VALUES ('Front-End');
INSERT INTO Dept (name) VALUES ('Back-End');
INSERT INTO Dept (name) VALUES ('QA');
INSERT INTO Dept (name) VALUES ('Security');
INSERT INTO Dept (name) VALUES ('Data');

INSERT INTO Manager (name) VALUES ('Chris, Nobles');
INSERT INTO Manager (name) VALUES ('Richard, Hastings');
INSERT INTO Manager (name) VALUES ('Sarah, Lee');
INSERT INTO Manager (name) VALUES ('Michael, Donnelly');
INSERT INTO Manager (name) VALUES ('Amber, Pearl');

UPDATE manager SET dept_id = 5  WHERE id = 1;
UPDATE manager SET dept_id = 3  WHERE id = 2;
UPDATE manager SET dept_id = 1  WHERE id = 3;
UPDATE manager SET dept_id = 2  WHERE id = 4;
UPDATE manager SET dept_id = 4  WHERE id = 5;


INSERT INTO NewHire (name, email, password, job_title, salary) VALUES('Steven Smith', 'ss@tech.com', 'password', 'Software Engineer', '$80,000');


public int updateSalary(String deptName, int newSalary) {
    Session session = HibernateUtil.getSessionFactory().openSession();
    try {
        session.beginTransaction();
        String sql = "UPDATE Employee e INNER JOIN Department d ON e.dept_id = d.id SET e.salary = :newSalary WHERE d.name = :deptName";
        SQLQuery query = session.createSQLQuery(sql);
        query.setParameter("newSalary", newSalary);
        query.setParameter("deptName", deptName);
        int result = query.executeUpdate();
        session.getTransaction().commit();
        return result;
    } catch (Exception e) {
        session.getTransaction().rollback();
        throw e;
    } finally {
        session.close();
    }
}








