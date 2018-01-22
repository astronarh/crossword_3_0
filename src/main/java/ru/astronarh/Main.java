package ru.astronarh;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import ru.astronarh.model.Cell;
import ru.astronarh.model.Crossword;
import ru.astronarh.model.Person;
import ru.astronarh.spring.config.AppConfig;
import ru.astronarh.spring.dao.CellDao;
import ru.astronarh.spring.dao.CrosswordDao;
import ru.astronarh.spring.dao.PersonDAO;


public class Main {
    public static void main(String[] args) {
        /*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

        CrosswordDao crosswordDao = context.getBean(CrosswordDao.class);
        Crossword crossword = new Crossword(1, 3, 3, 1, 9);
        crosswordDao.createCrossword(crossword);
        context.close();*/


        /*CellDao cellDao = context.getBean(CellDao.class);
        Cell cell = new Cell(1, "q", 1, "1", true, true, true);
        cellDao.createCell(cell);
        cellDao.getAllCells().forEach(System.out::println);

        context.close();*/


        /*PersonDAO personDAO = context.getBean(PersonDAO.class);

        System.out.println("List of person is:");

        for (Person p : personDAO.getAllPersons()) {
            System.out.println(p);
        }

        System.out.println("\nGet person with ID 2");

        Person personById = personDAO.getPersonById(2L);
        System.out.println(personById);

        System.out.println("\nCreating person: ");
        Person person = new Person(4L, 36, "Sergey", "Emets");
        System.out.println(person);
        personDAO.createPerson(person);
        System.out.println("\nList of person is:");

        for (Person p : personDAO.getAllPersons()) {
            System.out.println(p);
        }

        System.out.println("\nDeleting person with ID 2");
        personDAO.deletePerson(personById);

        System.out.println("\nUpdate person with ID 4");

        Person pperson = personDAO.getPersonById(4L);
        pperson.setLastName("CHANGED");
        personDAO.updatePerson(pperson);

        System.out.println("\nList of person is:");
        for (Person p : personDAO.getAllPersons()) {
            System.out.println(p);
        }

        context.close();*/
    }
}
