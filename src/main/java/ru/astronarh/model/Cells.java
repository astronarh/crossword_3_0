package ru.astronarh.model;

import java.util.List;

public class Cells {
    private List<Cell> cells;

    public List<Cell> getCells() {
        return cells;
    }

    public void setCells(List<Cell> cells) {
        this.cells = cells;
    }

    @Override
    public String toString() {
        return "Cells{" +
                "cells=" + cells +
                '}';
    }
}
