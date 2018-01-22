package ru.astronarh.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import ru.astronarh.model.CellMapper;
import ru.astronarh.model.Crossword;
import ru.astronarh.model.CrosswordMapper;

import javax.sql.DataSource;
import java.util.List;

@Component
public class CrosswordDaoImpl implements CrosswordDao {
    JdbcTemplate jdbcTemplate;

    private final String SQL_FIND_CROSSWORD = "select * from crosswords where id = ?";
    private final String SQL_DELETE_CROSSWORD = "delete from crosswords where id = ?";
    private final String SQL_GET_ALL = "select * from crosswords";
    private final String SQL_INSERT_CROSSWORD = "insert into crosswords(row, columns, idBegin, idEnd) values(?,?,?,?)";

    @Autowired
    public CrosswordDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Crossword getCrosswordById(long id) {
        return jdbcTemplate.queryForObject(SQL_FIND_CROSSWORD, new Object[] { id }, new CrosswordMapper());
    }

    @Override
    public boolean deleteCrosswordById(long id) {
        return jdbcTemplate.update(SQL_DELETE_CROSSWORD, id) > 0;
    }

    @Override
    public List<Crossword> getAllCrosswords() {
        return jdbcTemplate.query(SQL_GET_ALL, new CrosswordMapper());
    }

    @Override
    public boolean createCrossword(Crossword crossword) {
        return jdbcTemplate.update(SQL_INSERT_CROSSWORD, crossword.getRow(), crossword.getColumns(), crossword.getIdBegin(), crossword.getIdEnd()) > 0;
    }
}
