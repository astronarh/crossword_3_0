package ru.astronarh.model;

public class Crossword {
    private long id;
    private int row;
    private int columns;
    private int idBegin;
    private int idEnd;

    public Crossword() {
    }

    public Crossword(int id, int row, int columns, int idBegin, int idEnd) {
        this.id = id;
        this.row = row;
        this.columns = columns;
        this.idBegin = idBegin;
        this.idEnd = idEnd;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getColumns() {
        return columns;
    }

    public void setColumns(int columns) {
        this.columns = columns;
    }

    public int getIdBegin() {
        return idBegin;
    }

    public void setIdBegin(int idBegin) {
        this.idBegin = idBegin;
    }

    public int getIdEnd() {
        return idEnd;
    }

    public void setIdEnd(int idEnd) {
        this.idEnd = idEnd;
    }

    @Override
    public String toString() {
        return "Crossword{" +
                "id=" + id +
                ", row=" + row +
                ", columns=" + columns +
                ", idBegin=" + idBegin +
                ", idEnd=" + idEnd +
                '}';
    }
}
