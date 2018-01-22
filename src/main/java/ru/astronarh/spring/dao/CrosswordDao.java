package ru.astronarh.spring.dao;

import ru.astronarh.model.Crossword;

import java.util.List;

public interface CrosswordDao {
    Crossword getCrosswordById(long id);
    boolean deleteCrosswordById(long id);
    List<Crossword> getAllCrosswords();
    boolean createCrossword(Crossword crossword);
}
