package ru.astronarh.model;

public class Cell {
    private long id;
    private String letter;
    private int arrow;
    private String question;
    private boolean theLetter;
    private boolean theArrow;
    private boolean theQuestion;

    public Cell() {
    }

    public Cell(long id, String letter, int arrow, String question, boolean theLetter, boolean theArrow, boolean theQuestion) {
        this.id = id;
        this.letter = letter;
        this.arrow = arrow;
        this.question = question;
        this.theLetter = theLetter;
        this.theArrow = theArrow;
        this.theQuestion = theQuestion;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLetter() {
        return letter;
    }

    public void setLetter(String letter) {
        this.letter = letter;
    }

    public int getArrow() {
        return arrow;
    }

    public void setArrow(int arrow) {
        this.arrow = arrow;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public boolean isTheLetter() {
        return theLetter;
    }

    public void setTheLetter(boolean theLetter) {
        this.theLetter = theLetter;
    }

    public boolean isTheArrow() {
        return theArrow;
    }

    public void setTheArrow(boolean theArrow) {
        this.theArrow = theArrow;
    }

    public boolean isTheQuestion() {
        return theQuestion;
    }

    public void setTheQuestion(boolean theQuestion) {
        this.theQuestion = theQuestion;
    }

    @Override
    public String toString() {
        return "Cell{" +
                "id=" + id +
                ", letter='" + letter + '\'' +
                ", arrow=" + arrow +
                ", question='" + question + '\'' +
                ", theLetter=" + theLetter +
                ", theArrow=" + theArrow +
                ", theQuestion=" + theQuestion +
                '}';
    }
}
