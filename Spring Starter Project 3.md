# Sprint Starter Project 3

## Handling exceptions

You can write your Servlet, it can accept data. Suppose that, the the user want to search certain users on the webpage. You can determinate somebody serach for the user based on username.

- make searchForUser method in **Homecontroller**:

```java
@RequestMapping("/")
public String stories(Model model, Locale locale) {
    model.addAttribute("pageTitle", "For every day one story");
    model.addAttribute("stories", getStories());
    System.out.println(String.format("Request received. Language: %s, Country %s %n",locale.getLanguage(), locale.getDisplayCountry()));
    return "stories";
}

@RequestMapping("/user/{id}")
public String searchForUser(@PathVariable(value="id") String id) {
  return null;
}

private ArrayList<Story> getStories() {

}
```

With *@RequestMapping("/user/{id}")* we will reach the id of the user. The *@PathVariable* signs the way, "please" take out the PathVariable and search as id and store this as String in this id.

- after this code, add a @ExceptionHandler:

```java
@ExceptionHandler(Exception.class)
public String exceptionHandler(HttpServletRequest rA, Exception ex, Model model) {
  model.addAttribute("errMessage", ex.getMessage());
  return "exceptionHandler";
}
  ```

There is an other solution: **if you don't want to write so many exeptionhandler make a class for this, as ExceptionGeneral.java, copy the ExceptionGeneral.java file from source files on Github into Contoller package**
```java
package com.elsoproject.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionGeneral {

	@ExceptionHandler
	public String exception(Exception ex, Model model){
		model.addAttribute("exception",ex);
		return "whateverHandlesTheException";
	}
}
```
## JPA and Hybernate

We will watch, how we can automatize the flow of data into our program and back to the database.

Firstly, if you make new project, **you have to add JPA and H2.** (with Thymeleaf)

If you have existing project, you find the **pom.xml** where we write 2 things.

## ORM - Object-relational mapping

#### An idea of storing data, flowing data, where the objects can transform to line of certain database IN OBJECT ORIENTED LANGUAGES.

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

In the JDBC database we crated everything manually. However there is opportunity to ask help.

#### JPA and Hybernate

Here is a good example:

**JDBC -------> Scissor  
Hibernate --> Tailor**

The hybernate uses JDBC to help make database and save time for the developer.

## JPA/Java Persistance API = an inferface, which says  have to correspond to something

- open pom.xml and expand with:

```xml
<!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-data-jpa -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
    <version>2.2.5.RELEASE</version>
</dependency>
```
**With this dependency we get JPA and Hypernate.**

## H2 Embedded database

### It means we don't have to join our program to a external database, it creates a new one in the running time.

- expand pom.xml:

```xml
<!-- https://mvnrepository.com/artifact/com.h2database/h2 -->
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>runtime</scope>
</dependency>
```

After added 2 dependencies in the pom file, we visit **application.propertes** to define the way by last 2 lines:
```
spring.thymeleaf.cache=false
spring.mvc.locale-resolver=fixed
#spring.mvc.locale=en

spring.h2.console.enabled=true
spring.h2.console.path=/db
```

- run the localhost:8080/db and **you see the database**
- check JDBC URL: *jdbc:h2:mem:testdb*
- click on Test Connection button --> Test Successful
- click on connect button, YOU ARE INSIDE

## Entity and connections

Last time we crated a embedded database and activate JPA and Hybernate access.

The question is, **how we join SpringBoot Project with the Database? How get Springboot to generate a new database by Hibernate?**

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

If you have an **existing database,** you can join to your code by SpringBoot or  you can say here is a **definition about the database and make a new one.**

Currently we have an **internal H2 database** and we **have to define the tables and relations.**

The class and class variables can represent the datatable and columns. The lines are good to make objects. The objects inherit the values in the it's class variables what you can find in the table's columns. When you speak about database, there is no ID in Java so **it is important to use ID-s in the database and code.**

We created Story.java in the domain package. Story classi is Pojo, **it is really important there will be a private constructor in the Pojo**:

```java
private String author;

private Story() {

}
```

In the POJO, it is important variables name and getters, setters have **same name as database parameters**. So the framework will find it.

#### We say to Hiparnate, this is an Entity:

```java
@Entity
public class Story{}
```
The Pojo has ID ALWAYS if we have database. Copy the Story.class from github.

**@Entity** --> The Spring framwork find it and connect the values to database.
**@GeneratedValue** --> it signs, it generates for the database   
**@Id/ PRIMARY KEY** --> it signs, this is ID

In the HomeController comment this section:

```java
//		  Story story1 = new Story();
//		  story1.setTitle("My first Story");
//		  story1.setPosted(new Date());
//		  story1.setAuthor("John");
//		  story1.setContent("<p> This is a live data!!</p>");

//		  Story story2 = new Story();
//		  story2.setTitle("Second Story");
//		  story2.setPosted(new Date());
//		  story2.setAuthor("Peter");
//		  story2.setContent("<p> Peter's story is not important</p>");

//		  stories.add(story1);
//		  stories.add(story2);
```

We have registered entity which is object represents a datatable. The lines in the database can load to objects.

We created a blogger with getter and setter in Pojo.

- copy the blogger.java in domain package from this repository

The Blogger.class and Story.class has a connection each other.

```
@ManyToOne
	private Blogger blogger;
```
#### It is a connection rule, where I determinate, Blooger can be so many but toOne connection can be only one.
Many  --> for myself  
ToOne --> to other side of connection

*@OneToMany(mappedBy = "blogger")* - I give myself as boss, I have high level control and generate getter and setter.

- run the Springboot, entry database --> BLOOGER, STORY

----------------------------------------------------------------------------
*From this part, you have to import the github project and add Springboot. (Earlier Springboot version to use SQL Commands with the next conditions)*

#### SQL commands
```
SELECT * FROM BLOGGER

ID NAME AGE
(no rows, 6 ms)

SELECT * FROM STORY

ID CONTENT POSTED TITLE BLOGGER_ID
(no rows, 2 ms)

insert into Blogger (age,name) VALUES (21,'Gyula');
```

Every restarting of the Server this database disappears. Why? **Because this is a H2 database, it lives in the Server we can use for testing but not in production environment".**

**Springboot can make an external database which accepts your datas as user.**

- make an existing table(**data.sql**) in src/main/resources:
```
insert into Blogger (age,name) VALUES (21,'Gyula');
```

- restart the server, you will see on console using the new database

If you join now to database, you will see added Gyula user.

### Repository

The Java code uses database. It there is embedded database, it is not important for our coded. So the database can be  Oracle, MySQL, PostSQL etc.

- make a repository package **com.elsoproject.repository**

**Repository**: *it is a logical unit, it is responsible to our code can be communicate with entities and waiting objects from the database.*

I don't want to write sql command, I crate one automatically.

**Spring Boot Structure**

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

                  CrudRepository<Story, Long>
                  /       - what is ID datatype?
                 /        - what entity is used by connection?
                /         
               /
  StoryRepository
  - extends CrudRepository
  - get new abilities
          \
            \
Story entity \
              \
                Database
                (Story DataTable)

```

- make a new interface as StoryInferface.java with **Crudrepo**

#### We make a bridge between the code and database and repository is responsibe for the flow of data.

The id stored in long, so I give this:
```java
package com.elsoproject.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.elsoproject.domain.Story;

public interface StoryRepository extends CrudRepository<Story, Long> {

	//SELECT * FROM STORY
	List<Story> findAll();

	//SELECT * FROM STORY WHERE posted IN (SELECT max(posted) FROM story) LIMIT 1;
	Story findFirstByOrderByPostedDesc();

	Story findByTitle(String title);

}
```
With this, we got a bridge, what we can use independently with any type of database. This is the bridge, responsibe for the flow of data.

Theese were the main elements of building SpringBoot. I added more developments to the code, so check the Application. 
