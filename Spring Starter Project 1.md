# Building Spring Starter Project #1

- make a new Spring Starter project in SpringBoot:

```
Name: ElsoProject

Maven               Jar
8                   Java

Group: com.elsoproject
Artifact: elsoproject
Verison: 0.1
Description: Demo project for Spring Boot
Package: com.elsoproject

Spring Web
```

- run as SpringBoot app
- check localhost 8080 ---> Whitelabel Error Page

#### static folder: the user access this folder. This is content what we offer for the user. index.html's place.

- make a __index.html__ in the static folder:

```html
<!DOCTYPE html>
<html>

<head>
</head>

<body>

Szia Gyula!

Mi újság?

</body>
</html>

```
- restart and check the port, you will see the html
- make a new package: **com.elsoproject.controller**
- create a **HomeController java class** in this package:

```java
package com.elsoproject.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

	@RequestMapping("/")
	public String index() {
		return "Gizi neni! Jo, hogy latlak!";
	}
}
```

This **Controller** is **stronger** than **index.html**

- run the Server, you will see the **Controller**(not the html file)

--------------------------------------------------------

- rewrite @RestController --> @Controller and return "gizi"
- run the code --> Controller doesn't find gizi (you will get Whitelabel error)
--------------------------------------------------------
## API

You can create API framework which communicates with services(for example currency exchange). You don't want to show on your webpage, you want that, others call this API.

In this case, you can make **web.jar** what you upload to **maven repository** and others write in the **pom.xml** file as dependency and they can use your API and reference for this.

## Making view

- **delete HomeController.java**
- search an environment picture for your html , add to **static folder**
- make image tag in the html file:

```html
<img src="green.jpg"/>
```
- restart the application
- **we separate pictures** so make an **images folder** ant put the pic there in static folder
- add utf-8 codes in html :

```html
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>

</head>

<body>

Szia Gyula!

Mi újság?

<img src="green.jpg"/>

</body>
</html>
```

## Creating Blog System

** We don't give back @RestController, because we have to write all html codes in backend. We make independent html + css and it will be beautiful.""

- expand **index.html**:

```html
<!DOCTYPE html>
<html lang="en"
      xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymleaf.org">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Daily News</title>

    <link rel="stylesheet" th:href="@{css/main.css}" href="../static/css/main.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />

    <link href='https://fonts.googleapis.com/css?family=Calibri' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Exo' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container">

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-5" aria-expanded="false">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">dailynews.com</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-5">
                <p class="navbar-text navbar-right" >IP címed: <a>127.0.0.1</a></p>
            </div>
        </div>
    </nav>


    <article>
        <header>
            <h1 >This is the title</h1>
            <p>Posted on September 31, 2019 at 10:00 PM</p>
        </header>

 	    <section>
            <p>Bacon ipsum dolor amet burgdoggen tenderloin meatloaf chicken chuck kielbasa turducken pancetta. Alcatra rump bresaola, frankfurter drumstick jerky kielbasa tenderloin pork loin sirloin leberkas. Pork boudin hamburger shank leberkas capicola chicken pork chop pork loin. Chislic beef ribs shoulder pork corned beef, jowl kevin pork belly t-bone alcatra cupim. Landjaeger burgdoggen t-bone pig drumstick tenderloin pastrami doner brisket. Capicola pastrami turducken chicken bacon picanha. Ribeye alcatra pork belly shoulder frankfurter doner shankle.</p>
      		<p> Pork loin boudin venison, sausage beef ribs meatball salami pork belly chislic buffalo. Ball tip pancetta boudin, ribeye tenderloin beef ribs porchetta short ribs cupim pig. Ribeye pork chop bacon alcatra jerky landjaeger turducken corned beef cow. Andouille shoulder bresaola ground round hamburger. Frankfurter chuck andouille, porchetta pastrami picanha short ribs doner spare ribs salami rump kevin beef ribs. Rump prosciutto ham spare ribs shoulder ham hock.</p>
      		<p></p>
        </section>

        <footer>
            <address>
                Sent: <span>Anonymous</span>
            </address>
        </footer>
        <hr/>
    </article>

    <footer>
        <p>Produced by</p>
    </footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script>
</body>
</html>
```
__This is a static webpage, with fixed datas.__



## View ------------Server--------Database  

- **add thymeleaf dependency**(https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-thymeleaf/2.2.5.RELEASE):

```xml
<groupId>org.junit.vintage</groupId>
<artifactId>junit-vintage-engine</artifactId>
</exclusion>
</exclusions>
</dependency>

<!-- https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-thymeleaf -->
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-thymeleaf</artifactId>
<version>2.2.5.RELEASE</version>
</dependency>
```

You can **use devtools or place this in the application.proprties:**
```
spring.thymeleaf.cache=false
```
This value is false, it means **the browser won't cache the settings. IF you you devtools, SpringBoot does it alone**

- run server
- modfy the structure: in static, **make css and images folder**
- **put index.html into templates folder**
- **refactor index.html to stories.html**
- run Server
- make a HomeController.java:

```Java
package com.elsoproject.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

	@RequestMapping("/")
	public String stories() {
		return "stories";
	}
}
```
__The stories() returns the "stores" which will be view with the help of Thymeleaf. With @RestController you can get back simple "storeis" but if you try with @Controller you will get stories.html.__

- run (with @RestContoller) --> get stories in the browser
- modify: **@RestContoller --> Controller** and run

## With __@Controller annotation__ SpringBoot check the templates folder and there is stories.html and returns with it.

## __Thymeleaf is our connection__ beetween Java code reference and html page.

## th="${story : ${stories}"

### tags changes the original datas. It is very useful, if you wanna keep the original html datas from the frontend developer and you can improve the html by your codes. Here are the sample tags to read:

```html
xmlns:th="http://www.thymleaf.org">
<title th:text="${pageTitle}">Daily News</title>
<article th:each="story : ${stories}">
		<header>
				<h1 th:text="${story.title}">Ez itt a cím</h1>
				<p th:text="${#dates.format(story.posted, 'yyyy.MM.dd HH:mm')}">Posted on September 31, 2015 at 10:00 PM</p>
		</header>
<section th:utext="${story.content}">
```
__So we can change html with help of Thymeleaf.__

__Model__: it communicates between Java code and frontend.

- develop out Homecontroller:
```Java
	@RequestMapping("/")
	public String stories(Model model) {
		model.addAttribute("pageTitle", "For every day one story");
		return "stories";
	}
```
- in stories.html:
```html
<title th:text="${pageTitle}">Daily News</title>
```
This is fantastic, becuase we don't modify on the html but **I give a key** how I call from the java code.

- fresh page, **"you will see the new parameter**("For every day one story") in the browser

The model disappears, and you see a static webpage but this wepbage **is dynamic**.

## How to rewrite html to dynamic?

- import thymeleaf into pom.xml as dependency
- add xmlns:th="http://www.thymleaf.org" into the html
- put the html into **templates folder**
- check in Java, we have a **@Conntroller which sends back the view(xy.html as return "xy")**
- we never modify  href=”… tags, which is original data from the frontend developer

```html
 <link rel="stylesheet" th:href="@{css/main.css}" href="../static/css/main.css"/>
```
- make for this href a main.css in the css folder:

```css
.navbar {
    margin-top:15px;
}

header h1 {
    font-family: 'Exo', sans-serif;
    font-size: 36px;
}

p, address {
    font-family: 'Calibri', sans-serif;
}
```
- refresh the page (style is changed)

#### Currenty SpringBoot Structure:
```
com.elsoproject
		ElsoProject.java ---------------> Spring Boot starter class

		com.elsoproject.controller -----> Controllers
		HomeController.java

		com.elsoproject.service---------> Business Logics
		HomeService.java

		com.elsoproject.domain----------> POJO Storage

		com.elsoproject.repository------> Communication with database
```
- make this structure, Story class in domain package:

```Java
package com.elsoproject.domain;
import java.util.Date;


public class Story {


	private String title;
	private String content;
	private Date posted;
	private String author;

	public Story() {

	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPosted() {
		return posted;
	}

	public void setPosted(Date posted) {
		this.posted = posted;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "Story [title=" + title + "]";
	}

}
```
This includes the **title, content, posted date.** Now we can add stories to html.

- change HomeController:

```java
package com.elsoproject.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.elsoproject.domain.Story;

@Controller
public class HomeController {

	  @RequestMapping("/")
	  public String stories(Model model) {
	      model.addAttribute("pageTitle", "For every day one story");
	      model.addAttribute("stories", getStories());
	      return "stories";
	  }

	  private ArrayList<Story> getStories() {
		  ArrayList<Story> stories = new ArrayList<>();

		  Story story1 = new Story();
		  story1.setTitle("My first Story");
		  story1.setPosted(new Date());
		  story1.setAuthor("John");
		  story1.setContent("<p> This is a live data!!</p>");

		  Story story2 = new Story();
		  story2.setTitle("Second Story");
		  story2.setPosted(new Date());
		  story2.setAuthor("Peter");
		  story2.setContent("<p> Peter's story is not important</p>");

		  stories.add(story1);
		  stories.add(story2);

		  return stories;
	  }
}
```
There is no change, if you restart.
