package com.example.assignment2;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@org.springframework.stereotype.Controller
public class Controller {

    private final UserService userService;
    private List<Question> quizList;
    int quantity;
    int correctAnswer;
    int currentQuiz = 0;
    private static Question question;

    @Autowired
    public Controller(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("signin")
    public String toSignin(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "redirect:take-quiz";
        }
        return "form-signin";
    }

    @RequestMapping("signout")
    public String toSignout(HttpSession session) {
        session.removeAttribute("user");
        return "form-signin";
    }

    @RequestMapping("signup")
    public String toSignup(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "redirect:take-quiz";
        }
        return "form-signup";
    }

    @RequestMapping("take-quiz")
    public String toTakeQuiz(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:signin";
        }
        return "form-take-quiz";
    }

    @RequestMapping("make-quiz")
    public String toMakeQuiz(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:signin";
        } else if (user.getRole().equals("user")) {
            return "redirect:take-quiz";
        }
        return "form-make-quiz";
    }

    @RequestMapping("manage-quiz")
    public String toManageQuiz(HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:signin";
        } else if (user.getRole().equals("user")) {
            return "redirect:take-quiz";
        }
        List<Question> questionList = userService.getQuestions();
        session.setAttribute("questionList", questionList);
        return "form-manage-quiz";
    }

    @PostMapping("login-choice")
    public String checkLoginChoice(@RequestParam("submitButton") String submitButton,
                                   @RequestParam("username") String username,
                                   @RequestParam("password") String password,
                                   HttpServletRequest request,
                                   HttpServletResponse response) throws ServletException, IOException {
        if ("Sign in".equals(submitButton)) {
            request.setAttribute("username", username);
            request.setAttribute("password", password);

            if (username.isEmpty() || password.isEmpty()) {
                request.setAttribute("error", "Username and password cannot be null. Check again, please!");
                return "form-signin";
            }

            request.getServletContext().getRequestDispatcher("/authentication").forward(request, response);
        }
        return ("form-signup");
    }

    @RequestMapping("authentication")
    public String authentication(HttpSession session,
                                 HttpServletRequest request) {
        String username = (String) request.getAttribute("username");
        String password = (String) request.getAttribute("password");

        boolean result = userService.authentication(username, password);

        if (result) {
            User user = userService.getUser(username);
            session.setAttribute("user", user);
            return "redirect:take-quiz";
        } else {
            request.setAttribute("error", "User or password is wrong.");
            return "form-signin";
        }
    }

    @PostMapping("filled-form")
    public String register(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam("email") String email,
                        @RequestParam("role") String role,
                           HttpServletRequest request) {
        boolean exist = userService.checkExist(username);

        if (username.isEmpty() || password.isEmpty() || email.isEmpty()) {
            request.setAttribute("error", "Input cannot be null. Check again, please!");
            return "form-signup";
        }
        else if (exist) {
            request.setAttribute("error", "This username is exist.");
            return "form-signup";
        } else {
            userService.insertUser(new User(username, password, email, role));
            return "redirect:signin";
        }

    }

    @GetMapping("filled-question")
    public String addQuestion(@RequestParam("questionContent") String questionContent,
                              @RequestParam("option1") String option1,
                              @RequestParam("option2") String option2,
                              @RequestParam("option3") String option3,
                              @RequestParam("option4") String option4,
                              HttpServletRequest request) {
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");
        String answer4 = request.getParameter("answer4");

        if (option1 == null || option2 == null || option3 == null || option4 == null) {
            request.setAttribute("error", "Options cannot be null. Check again, please!");
            return "form-make-quiz";
        }

        if (answer1 == null && answer2 == null && answer3 == null && answer4 == null) {
            request.setAttribute("error", "The question needs 1 or more answers. Check again, please!");
            return "form-make-quiz";
        }

        convertAnswer(answer1, answer2, answer3, answer4,
                option1, option2, option3, option4);

        userService.insertQuestion(new Question(questionContent,
                option1, option2, option3, option4,
                answer1, answer2, answer3, answer4));
        return "form-take-quiz";
    }

    private void convertAnswer(String answer1, String answer2, String answer3, String answer4,
                               String option1, String option2, String option3, String option4) {
        if (answer1 != null) {
            if (Integer.parseInt(answer1) == 1) {
                answer1 = option1;
            }
        }

        if (answer2 != null) {
            if (Integer.parseInt(answer2) == 2) {
                answer2 = option2;
            }
        }
        if (answer3 != null) {
            if (Integer.parseInt(answer3) == 3) {
                answer3 = option3;
            }
        }

        if (answer4 != null) {
            if (Integer.parseInt(answer4) == 4) {
                answer4 = option4;
            }
        }
    }

    @RequestMapping("doing-quiz")
    public String setQuiz (@RequestParam("quizQuantity") int quizQuantity) {
        if (quizQuantity > 0) {
            quantity = quizQuantity;
            quizList = userService.getQuestionsByQuantity(quizQuantity);
        }
        return "redirect:quiz";
    }

    @RequestMapping("quiz")
    public String doQuiz(HttpSession session) {
        currentQuiz++;
        session.setAttribute("quantity", currentQuiz);
        if (currentQuiz > quantity) {
            String result = String.valueOf(((double) correctAnswer/(double) quantity)*100);
            if (result.length() > 5) {
                result = result.substring(0, 5);
            }
            question = null;
            currentQuiz = 0;
            quantity = 0;
            correctAnswer = 0;
            session.setAttribute("result", result);
            return "form-result";
        } else {
            question = quizList.get(currentQuiz-1);
            session.setAttribute("question", question);
            return "form-quiz";
        }
    }

    @RequestMapping("evaluate")
    public String evaluate(HttpServletRequest request) {
        String userAnswer1 = request.getParameter("an1");
        String userAnswer2 = request.getParameter("an2");
        String userAnswer3 = request.getParameter("an3");
        String userAnswer4 = request.getParameter("an4");

        question = quizList.get(currentQuiz-1);

        if (userAnswer1 == null) {
            userAnswer1 = "";
        }
        if (userAnswer2 == null) {
            userAnswer2 = "";
        }
        if (userAnswer3 == null) {
            userAnswer3 = "";
        }
        if (userAnswer4 == null) {
            userAnswer4 = "";
        }

        if (userAnswer1.equals(question.getAnswer1()) && userAnswer2.equals(question.getAnswer2()) &&
                userAnswer3.equals(question.getAnswer3()) && userAnswer4.equals(question.getAnswer4())) {
                   correctAnswer++;
        }
        return "redirect:quiz";
    }
}

