# Building Spring Starter Project #2

We have to use **article tag** in the **Stories.html.** Artice like a for loop, we go on a list and  with **$** sign add a new name for certain element.

```html
<article th:each="story : ${stories}">
      <header>
          <h1 th:text="${story.title}">This is the address</h1>
          <p>Posted on September 31, 2018 at 10:00 PM</p>
```

- run and you will see the change
- modify other content:
```html
<article th:each="story : ${stories}">
    <header>
        <h1 th:text="${story.title}">This is the address</h1>
        <p>Posted on September 31, 2018 at 10:00 PM</p>
    </header>

  <section th:text = "${story.content}">
        <p>Bacon ipsum dolor amet burgdoggen tenderloin meatloaf chicken chuck kielbasa turducken pancetta. Alcatra rump bresaola, frankfurter drumstick jerky kielbasa tenderloin pork loin sirloin leberkas. Pork boudin hamburger shank leberkas capicola chicken pork chop pork loin. Chislic beef ribs shoulder pork corned beef, jowl kevin pork belly t-bone alcatra cupim. Landjaeger burgdoggen t-bone pig drumstick tenderloin pastrami doner brisket. Capicola pastrami turducken chicken bacon picanha. Ribeye alcatra pork belly shoulder frankfurter doner shankle.</p>
      <p> Pork loin boudin venison, sausage beef ribs meatball salami pork belly chislic buffalo. Ball tip pancetta boudin, ribeye tenderloin beef ribs porchetta short ribs cupim pig. Ribeye pork chop bacon alcatra jerky landjaeger turducken corned beef cow. Andouille shoulder bresaola ground round hamburger. Frankfurter chuck andouille, porchetta pastrami picanha short ribs doner spare ribs salami rump kevin beef ribs. Rump prosciutto ham spare ribs shoulder ham hock.</p>
      <p></p>
    </section>
```

You will see **new content.(This is a live data!!)**

You see < p > tag in the browser, so **add a + u here** and disappears:
```html
  <section th:utext = "${story.content}">
```

- refresh
- modify other content the date:
```html
<h1 th:text="${story.title}">This is the address</h1>
<p th:text="${story.posted}">Posted on September 31, 2019 at 10:00 PM</p>
```
- restart,  **you will see the current date**

## i18n

- modify the date format:
```html
 <p th:text="${#dates.format(story.posted, 'yyyy.MM.dd HH:mm')}">Posted on September 31, 2019 at 10:00 PM</p>
```

**i18n**: Internationalization. It's function to make websites international, people who speak different languages understand it. Lot of browser knows the basic language so set the optimal language for your webpage.

- create files in src/main/resources

```
messages_en.properties
yourip=Your IP address
footerText=made by Test

messages_de.properties
yourip=deine IP-Addresse:
footerText= gemacht von Test

messages.properties
yourip= Ez a te IP címed.
footerText= készült a Test megbízásából
```
#### our Thymeleaf tags in html:
```html
<!DOCTYPE html>
<html lang="en"
      xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymleaf.org">

<title th:text="${pageTitle}">Daily News</title>

<link rel="stylesheet" th:href="@{css/main.css}" href="../static/css/main.css"/>

<article th:each="story : ${stories}">

<p th:text="${#dates.format(story.posted, 'yyyy.MM.dd HH:mm')}">Posted on September 31, 2019 at 10:00 PM</p>

   <p class="navbar-text navbar-right"  th:text="#{yourip}">IP címed: <a href="#" class="navbar-link">127.0.0.1</a></p>

 <p th:text="#{footerText}">Készült TestJakab megbízásából</p>

```

- make a new hu property file:
```
messages_hu.properties
yourip=Az IP cimed
footerText=Készült GipgszJakab megbízásából
```
- expand **application.proprties:**:

```
spring.thymeleaf.cache=false
spring.mvc.locale-resolver=fixed
#spring.mvc.locale=en
```
- set the language to English in Firefox
- check 8080 in Firefox : **made by TestJakab**
- check 8080 in Chromre : **Készült GipszJakav megbízásából**

#### Local Setting on HomeController
```java
@RequestMapping("/")
public String stories(Model model, Locale locale) {
    model.addAttribute("pageTitle", "For every day one story");
    model.addAttribute("stories", getStories());
    System.out.println(String.format("Request received. Language: %s, Country %s %n",locale.getLanguage(), locale.getDisplayCountry()));
    return "stories";
   }
```

#### Setting up Hungarian special characters
- open messages_hu.properties in Notepad++
- **set ANSI codes**(kódolás--> átalakítás ANSI kódolásra) if doesn't work, use this webpage: https://native2ascii.net/
- **right click on src/main/resources --> REFRESH**

## Error-Handling in SpringBoot

You have to handle the errors. Try: http://localhost:8080/hfghjydhd in the browser. You get Whitelabel Error Page.

- create error.html in templates:

```html
<!DOCTYPE html>
<html lang="en"
      xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymleaf.org">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title th:text="${pageTitle}">Daily Title</title>

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
                <a class="navbar-brand" href="#">something.com</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-5">
                <p class="navbar-text navbar-right" th:text="#{yourip}">IP címed: <a href="#" class="navbar-link">127.0.0.1</a></p>
            </div>
        </div>
    </nav>


    <article>
        <header>
            <h1 th:text="${error}">This is wrong.</h1>
        </header>

 	    <section >
            <p th:text="${message}">This is message.</p>
        </section>



    </article>

    <footer>
        <p th:text="#{footerText}">Made by GipszJakab megbízásából</p>
    </footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script>
</body>
</html>
```

- restart and run

**The Springboot and a Thymeleaf work together, they discover there is an error.html and give back to the user**

- create ErrorPageController class:

```java
package com.elsoproject.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class ErrorPageController implements ErrorController {

	private static final String ERR_PATH = "/error";

	@RequestMapping(ERR_PATH)
	public String error() {
		return null;
	}

	@Override
	public String getErrorPath() {
		return ERR_PATH;
	}
}
```
## Errors Details

- Timestamp
- Status
- Error
- Message
- Path

**RequestAtribute:** *a box, which stores the attributes of the error. It waits a request from us, request includes datas.* We ask this.

Request includes a lot of data and we can ask certain element of the request, attributes and we we can make an empty errorAttributes box where we can inject an object from outside.

ErrorPageController:

```java
package com.elsoproject.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.WebRequest;

@Controller
public class ErrorPageController implements ErrorController {

	private static final String ERR_PATH = "/error";

	private ErrorAttributes errorAttributes;

	@Autowired
	public void setErrorAttributes(ErrorAttributes errorAttributes){
		this.errorAttributes = errorAttributes;
	}

	@RequestMapping(ERR_PATH)
	public String error(Model model, HttpServletRequest request) {
		RequestAttributes rA = new ServletRequestAttributes(request);
		Map<String,Object> error = this.errorAttributes.getErrorAttributes((WebRequest) rA, true);

		model.addAttribute("timestamp",error.get("timestamp"));
		model.addAttribute("error",error.get("error"));
		model.addAttribute("message",error.get("message"));
		model.addAttribute("path",error.get("path"));
		model.addAttribute("status",error.get("status"));

		return "detailedError";
	}

//	@RequestMapping(ERR_PATH)
//	public String notFound(Model model, HttpServletRequest request) {
//		return "404";
//	}
//
//
	@Override
	public String getErrorPath() {
		return ERR_PATH;
	}

}

```

- copy the detailedError.html from the source files on Github
- delete comment in ErrorPagecontroller and you get:

```
return "detailedError";
}


public String notFound(Model model, HttpServletRequest request) {
return "404";
}
```
