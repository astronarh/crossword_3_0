package ru.astronarh.web.controller;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import ru.astronarh.model.Cell;
import ru.astronarh.model.Crossword;
import ru.astronarh.spring.config.AppConfig;
import ru.astronarh.spring.dao.CellDao;
import ru.astronarh.spring.dao.CrosswordDao;
import java.util.List;

public class ReadCrosswords {
    public static List<Crossword> readAll(){
        List<Crossword> crosswords;
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        CrosswordDao crosswordDao = context.getBean(CrosswordDao.class);
        crosswords = crosswordDao.getAllCrosswords();
        context.close();
        return crosswords;
    }

    public static Crossword read(long id) {
        Crossword crossword;
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        CrosswordDao crosswordDao = context.getBean(CrosswordDao.class);
        crossword = crosswordDao.getCrosswordById(id);
        context.close();
        return crossword;
    }

    public static List<Cell> readCells(int idBegin, int idEnd) {
        List<Cell> cells;
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        CellDao cellDao = context.getBean(CellDao.class);
        cells = cellDao.getCellsBetweenValues(idBegin, idEnd);
        context.close();
        return cells;
    }
}
