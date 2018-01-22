package ru.astronarh.web.controller;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.astronarh.model.Cell;
import ru.astronarh.model.Cells;
import ru.astronarh.model.Crossword;
import ru.astronarh.spring.config.AppConfig;
import ru.astronarh.spring.dao.CellDao;
import ru.astronarh.spring.dao.CrosswordDao;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class WriteSQLController {
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setAutoGrowCollectionLimit(1024);
    }

    @RequestMapping(value = { "createCrossword" }, method = RequestMethod.GET)
    public ModelAndView createCrossword(    @RequestParam(value = "column", required = false) String inColumn,
                                            @RequestParam(value = "lines", required = false) String inLines) {
        ModelAndView model = new ModelAndView();
        model.setViewName("createCrossword");

        if (inColumn != null && inLines != null) {
            model.addObject("inColumn", IntStream.range(0, Integer.parseInt(inColumn)).boxed().collect(Collectors.toList()));
            model.addObject("inLines", IntStream.range(0, Integer.parseInt(inLines)).boxed().collect(Collectors.toList()));
        }

        List<Integer> column = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        List<Integer> lines = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        model.addObject("column", column);
        model.addObject("lines", lines);

        return model;
    }

    @RequestMapping(value = { "/save" }, method = RequestMethod.POST)
    public ModelAndView save(   @ModelAttribute("cells") Cells cells,
                                @ModelAttribute("size") String size) {
        ModelAndView model = new ModelAndView();
        model.setViewName("createCrossword");
        List<Integer> column = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        List<Integer> lines = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        model.addObject("column", column);
        model.addObject("lines", lines);
        writeToSql(cells, size);
        return model;
    }

    private void writeToSql(Cells cells, String size) {
        List<Cell> cellList = converter(cells.getCells());
        int row = Integer.parseInt((size.split(" "))[1]);
        int columns = Integer.parseInt((size.split(" "))[0]);

        AnnotationConfigApplicationContext maxIdCell = new AnnotationConfigApplicationContext(AppConfig.class);
        CellDao maxIdCellDao = maxIdCell.getBean(CellDao.class);
        System.out.println(maxIdCellDao.getAllCells().size());
        List<Cell> presentCell = maxIdCellDao.getAllCells();
        long lastId = presentCell.get(presentCell.size() - 1).getId();
        System.out.println(lastId);
        maxIdCell.close();

        Crossword crossword = new Crossword(0, row, columns, (int) lastId + 1, (int) (lastId + (row * columns)));

        AnnotationConfigApplicationContext contextCell = new AnnotationConfigApplicationContext(AppConfig.class);
        CellDao cellDao = contextCell.getBean(CellDao.class);
        for (Cell cell : cellList) cellDao.createCell(cell);
        contextCell.close();

        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        CrosswordDao crosswordDao = context.getBean(CrosswordDao.class);
        crosswordDao.createCrossword(crossword);
        context.close();
    }

    private List<Cell> converter(List<Cell> cells) {
        for (Cell cell : cells) {
            try {
                cell.setLetter(new String(cell.getLetter().getBytes("ISO-8859-1"), "utf-8"));
                cell.setQuestion(new String(cell.getQuestion().getBytes("ISO-8859-1"), "utf-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return cells;
    }
}
