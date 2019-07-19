# Tutorial Board / Spring-Framework

Basic  bulletin board using 'Springframework' and 'h2 database'.

## Installation

```bash
Clone the repo: get clone https://github.com/dahoonchoi/Tutorial-board-Spring-framework.git
```
Because h2 database is used, h2 must be installed.
```bash
in http://www.h2database.com 
```
## Usage

```bash
Install 'org.springframework', 'com.h2database', 'commons-dbcp' in addition to dependencies.
```

## Contributing

If the value entered using the 'HttpSession' module matches, the session value is saved.
```java
	UserVO user = userDAO.getUser(vo);
		
	if (user != null) {
		session.setAttribute("userName", user.getName());
		return "getBoardList.do";
	} else {
		return "login.jsp";
	}
```
can use session values to modify posts that you have created.
```java
	HttpSession session = request.getSession();
		String username = (String) session.getAttribute("userName");
		BoardVO boardvo = boardService.getBoard(vo);

		if (username.equals(boardvo.getWriter())) {
			model.addAttribute("board", boardService.getBoard(vo));
			return "updateBoard.jsp";
		} else {
			return "getBoard.jsp";
		}
```



## ScrenShot

indexPage
![indexPage](https://user-images.githubusercontent.com/41640324/61532279-4e61e200-aa64-11e9-9cd8-a01bee42f986.PNG)
getPage
![getBoard](https://user-images.githubusercontent.com/41640324/61532337-794c3600-aa64-11e9-808b-a34a92992c90.PNG)
![getBoard](https://user-images.githubusercontent.com/41640324/61532363-8ff28d00-aa64-11e9-88ee-048fb9ef37e9.PNG)
