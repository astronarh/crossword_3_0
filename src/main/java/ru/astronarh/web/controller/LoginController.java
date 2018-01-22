package ru.astronarh.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.astronarh.model.Cell;
import ru.astronarh.model.Crossword;

import java.util.List;

@Controller
public class LoginController {

    @RequestMapping(value = { "/"}, method = RequestMethod.GET)
    public ModelAndView welcomePage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("welcomePage");
        return model;
    }

    @RequestMapping(value = { "/about"}, method = RequestMethod.GET)
    public ModelAndView aboutPage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("about");
        return model;
    }

    @RequestMapping(value = { "/homePage"}, method = RequestMethod.GET)
    public ModelAndView homePage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("homePage");
        return model;
    }

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
                                  @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid Credentials provided.");
        }

        if (logout != null) {
            model.addObject("message", "Logged out from JournalDEV successfully.");
        }

        model.setViewName("loginPage");
        return model;
    }

    @RequestMapping(value = "/crossword", method = RequestMethod.GET)
    public ModelAndView crossword(@RequestParam(value = "id", required = false) String id) {
        ModelAndView model = new ModelAndView();
        model.setViewName("crossword");



        Crossword crossword;
        List<Cell> cellList;
        Cell[][] cells;
        if (id != null) {
            crossword = ReadCrosswords.read(Long.parseLong(id));
            cellList = ReadCrosswords.readCells(crossword.getIdBegin(), crossword.getIdEnd());

            cells = new Cell[crossword.getRow()][crossword.getColumns()];
            int counter = 0;
            for (int i = 0; i < crossword.getRow(); i++) {
                for (int j = 0; j < crossword.getColumns(); j++) {
                    cells[i][j] = cellList.get(counter++);
                }
            }
            model.addObject("cells", cells);
            model.addObject("cellList", cellList);
            model.addObject("crossword", crossword);
        } else {
            List<Crossword> crosswords = ReadCrosswords.readAll();
            model.addObject("crosswords", crosswords);
            /*cellList = Arrays.asList(
                    new Cell(1, "1", 1, "1", true, true, false),
                    new Cell(2, "2", 2, "2", true, false, false),
                    new Cell(3, "3", 3, "3", true, true, false),
                    new Cell(4, "4", 4, "Подбор количества символов количества", false, false, true),
                    new Cell(5, "5", 5, "5", true, false, false),
                    new Cell(6, "6", 6, "6", true, false, false),
                    new Cell(7, "7", 7, "7", false, false, true),
                    new Cell(8, "8", 8, "8", true, false, false),
                    new Cell(9, "9", 9, "9", true, false, false));
            crossword = new Crossword(1, 3, 3, 1, 9);*/
        }
        return model;
    }

}
