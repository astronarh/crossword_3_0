package ru.astronarh.web.controller;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.astronarh.model.Cell;
import ru.astronarh.model.Crossword;
import ru.astronarh.spring.config.AppConfig;
import ru.astronarh.spring.dao.CellDao;
import ru.astronarh.spring.dao.CrosswordDao;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class EditBaseCrosswords {
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setAutoGrowCollectionLimit(1024);
    }

    @RequestMapping(value = { "/delete" }, method = RequestMethod.GET)
    public ModelAndView deleteCrossword (@RequestParam(value = "id", required = false) String id) {
        ModelAndView model = new ModelAndView();
        model.setViewName("crossword");
        deleteCrosswordBuId(id);
        List<Crossword> crosswords = ReadCrosswords.readAll();
        Crossword crossword;
        List<Cell> cellList;
        cellList = Arrays.asList(
                new Cell(1, "1", 1, "1", true, true, false),
                new Cell(2, "2", 2, "2", true, false, false),
                new Cell(3, "3", 3, "3", true, true, false),
                new Cell(4, "4", 4, "Подбор количества символов количества", false, false, true),
                new Cell(5, "5", 5, "5", true, false, false),
                new Cell(6, "6", 6, "6", true, false, false),
                new Cell(7, "7", 7, "7", false, false, true),
                new Cell(8, "8", 8, "8", true, false, false),
                new Cell(9, "9", 9, "9", true, false, false));
        crossword = new Crossword(1, 3, 3, 1, 9);
        Cell[][] cells = new Cell[crossword.getRow()][crossword.getColumns()];
        int counter = 0;
        for (int i = 0; i < crossword.getRow(); i++) {
            for (int j = 0; j < crossword.getColumns(); j++) {
                cells[i][j] = cellList.get(counter++);
            }
        }
        model.addObject("crosswords", crosswords);
        model.addObject("cells", cells);
        model.addObject("cellList", cellList);
        model.addObject("crossword", crossword);
        model.addObject("inColumn", IntStream.range(0, 4).boxed().collect(Collectors.toList()));
        model.addObject("inLines", IntStream.range(0, 4).boxed().collect(Collectors.toList()));
        return model;
    }

    private void deleteCrosswordBuId(String id) {
        Crossword crossword;
        List<Cell> cellList;
        long idBegin;
        long idEnd;

        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(AppConfig.class);
        CrosswordDao crosswordDao = applicationContext.getBean(CrosswordDao.class);
        crossword = crosswordDao.getCrosswordById(Long.parseLong(id));
        crosswordDao.deleteCrosswordById(Long.parseLong(id));
        applicationContext.close();

        idBegin = crossword.getIdBegin();
        idEnd = crossword.getIdEnd();

        AnnotationConfigApplicationContext applicationContextCell = new AnnotationConfigApplicationContext(AppConfig.class);
        CellDao cellDao = applicationContextCell.getBean(CellDao.class);
        cellDao.deleteCellsBetweenValues(idBegin, idEnd);
        applicationContextCell.close();
    }
}
