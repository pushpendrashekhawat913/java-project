# Setup Guide (Windows + VS Code)

1. Install JDK 17+, Maven, MySQL Server, and Apache Tomcat 11.
2. In VS Code, install **Extension Pack for Java**.
3. Start MySQL and open `database/shopsphere.sql` in MySQL Workbench; execute it.
4. Open the `ShopSphere` folder in VS Code.
5. Open Terminal → New Terminal and run `mvn clean package`.
6. Copy `target/ShopSphere.war` into Tomcat 11's `webapps` folder.
7. Start Tomcat using `bin/startup.bat`.
8. Visit `http://localhost:8080/ShopSphere/`.
9. If products fail to load, check MySQL is running and set `SHOPSPHERE_DB_URL`, `SHOPSPHERE_DB_USER`, and `SHOPSPHERE_DB_PASSWORD` in the environment before starting Tomcat.

This starter currently includes the product catalogue/search only. Login, cart, checkout and admin modules are not yet implemented.
