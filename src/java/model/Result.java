package model;

import javax.persistence.*;

@Entity
@Table(name = "RESULT")
public class Result {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int resultId;

    @Column(name = "STUDENT_ID")
    private int studentId;

    @Column(name = "QUIZ_ID")
    private int quizId;

    @Column(name = "SCORE")
    private int score;

    @Column(name = "TOTAL_QUESTIONS")
    private int totalQuestions;

    @Column(name = "PERCENTAGE")
    private double percentage;

    public Result() {
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }
}