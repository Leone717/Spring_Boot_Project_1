# SpringBoot Application

In this tutorial, you can follow me, how we can build a SpringBoot Application:

1.Building Spring Starter Project #1  
2.Building Spring Starter Project #2  
3.Building Spring Starter Project #3

**Run:**

- download *SpringBoot* and run *STS.exe*
- copy the *ElsoProject project* from here and run in SpringBoot
- use web browser(*Firefox, Chrome etc*)

**Try in the browser**:

- http://localhost:8080/ --> You see a blog
- http://localhost:8080/fhdfhtdyh --> 404 error page
- http://localhost:8080/detailedError --> 404 error page
- http://localhost:8080/error --> 999 error page
- http://localhost:8080/story.html --> Teszt tartalom page

**They are dynamic pages, get datas from the data.sql database** *(Thymeleaf)*  
**If you open the html-s in file exlorer you get the original form, stories and user.(STATIC)**

- http://localhost:8080/db/ --> H2 embedded database
  * connect
  * CLICK BLOGGER --> run --> Get bloggers (ID,AGE,NAME)
  * CLICK STORY --> run --> Get Stories (ID, CONTENT, POSTED, TITLE, BLOGGER_ID)
  * use SQL commands to Create, Read, Upgrade or Delete 


###  SpringBoot Structure:

```
View
(HTML5+CSS+JS)
          |
      Controllers
      -control the "traffic"
                |
            Service
            - calculations
            - business logics
                      |
                  Repository
                  - communicate with database
                                |
                                |Entities
                                |
                                Database
```

```
com.elsoproject
		ElsoProjectApplication.java ---------------> Spring Boot starter class

		com.elsoproject.controller -----> Controllers
		HomeController.java

		com.elsoproject.service---------> Business Logics
		HomeService.java

		com.elsoproject.domain----------> POJO Storage

		com.elsoproject.repository------> Communication with database
```



**src/main/resources-> static folder:** it stores static datas, *images, css styles etc.*

**templates folder**: the user access this folder. This is content what we offer for the user. index.html's place.

**application.properties**: it stores our application setting. *for example cache in the browser*  

**data.sql**: our database

**messages_de.properties-messages_en.properties-messages_hu.properties: i18n**: language files, the SpringBoot based on webbrowser language send back the correct language file.

**pom.xml** includes different dependencies:

- **Thymeleaf:** it helps to make html data to be dynamic without modification of original html
```html
 <h1 th:text="${story.title}">This is the address</h1>
```
-**h2 database:** it is an embedded database, it helps me to make a internal database and save time. We can use here SQL commands to make objects/lines.

- **JPA/Java Persistance API** = an inferface, which says have to correspond to something. The generated data in Java, lives in the database later, we don't loose it:
```
PRODUCTS  --> Database
Name | Size | Price | PhotoURL
|
|
V
MY CODE             Product Object
Product Name        glass       ------->     Products
        Size        10          <------- glass|10|300|photo.jpg
        Price       300
        PhotoURL    photo.jpg
```
