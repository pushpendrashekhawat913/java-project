# ShopSphere — RTU Advanced Java E-Commerce Project

A beginner-friendly starter implementation based on the uploaded RTU ShopSphere project guide.

## Implemented in this starter
- Responsive e-commerce product listing UI
- Search products by name, brand, or description
- Java 17 + Maven WAR project
- Jakarta Servlet 6.1 / JSP / JSTL
- JDBC DAO layer using `PreparedStatement`
- MySQL schema and sample products
- Product discount-price calculation
- Health endpoint at `/health`

## Prerequisites
- JDK 17 or later
- Apache Maven
- MySQL Server
- Apache Tomcat 11
- VS Code with Extension Pack for Java (or another Java IDE)

## 1. Create the database
Open MySQL Workbench or a MySQL terminal and run the complete file `database/shopsphere.sql`.

## 2. Configure database credentials
The defaults are:
- URL: `jdbc:mysql://localhost:3306/shopsphere?useSSL=false&serverTimezone=UTC`
- User: `root`
- Password: empty

Set environment variables if your local setup differs:
- `SHOPSPHERE_DB_URL`
- `SHOPSPHERE_DB_USER`
- `SHOPSPHERE_DB_PASSWORD`

Never commit real credentials to GitHub.

## 3. Build the WAR
Open a terminal in the project root:
```bash
mvn clean package
```
The output should be `target/ShopSphere.war`.

## 4. Deploy to Tomcat 11
Copy `target/ShopSphere.war` into Tomcat 11's `webapps` directory and start Tomcat. Open:
`http://localhost:8080/ShopSphere/`

Product pages need MySQL running and configured. `/health` checks only that the web application starts, not database connectivity.

## Important project status
This is a runnable **starter**, not yet the complete scope described by the guide. Registration/login, sessions and filters, cart persistence, checkout/order placement, admin CRUD, Swing admin, Socket networking, RMI, JNDI, internationalization and report diagrams remain future phases. The Add to bag button is currently a placeholder. No real payment processing is implemented.

## Suggested next phases
1. User registration/login with hashed passwords and session management.
2. Persistent cart and secure checkout/order placement.
3. Admin authentication and product/category/order CRUD.
4. Authentication/Admin filters, listeners, JSP tag files and internationalization.
5. Swing admin, Socket client/server, RMI inventory service, JNDI demonstration.
6. Test cases, screenshots, diagrams and final RTU report.
