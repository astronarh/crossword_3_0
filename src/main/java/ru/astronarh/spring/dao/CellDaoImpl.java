package ru.astronarh.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import ru.astronarh.model.Cell;
import ru.astronarh.model.CellMapper;

import javax.sql.DataSource;
import java.util.List;

@Component
public class CellDaoImpl implements CellDao{
    JdbcTemplate jdbcTemplate;

    private final String SQL_FIND_CELL = "select * from cell where id = ?";
    private final String SQL_DELETE_CELL = "delete from cell where id = ?";
    private final String SQL_UPDATE_CELL = "update cell set letter = ?, arrow = ?, question  = ?, theLetter = ?, theArrow = ?, theQuestion  = ? where id = ?";
    private final String SQL_GET_ALL = "select * from cell";
    private final String SQL_INSERT_CELL = "insert into cell(letter, arrow, question, theLetter, theArrow, theQuestion) values(?,?,?,?,?,?)";
    private final String SQL_FIND_CELLS_BETWEEN_VALUES = "select * from cell where id BETWEEN ? AND ?";
    private final String SQL_DELETE_CELLS_BETWEEN_VALUES = "delete from cell where id BETWEEN ? AND ?";

    @Autowired
    public CellDaoImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Cell getCellById(Long id) {
        return jdbcTemplate.queryForObject(SQL_FIND_CELL, new Object[] { id }, new CellMapper());
    }

    @Override
    public List<Cell> getCellsBetweenValues(long idBegin, long idEnd) {
        return jdbcTemplate.query(SQL_FIND_CELLS_BETWEEN_VALUES, new Object[]{idBegin, idEnd}, new CellMapper());
    }

    @Override
    public boolean deleteCellsBetweenValues(long idBegin, long idEnd) {
        return jdbcTemplate.update(SQL_DELETE_CELLS_BETWEEN_VALUES, idBegin, idEnd) > 0;
    }

    @Override
    public List<Cell> getAllCells() {
        return jdbcTemplate.query(SQL_GET_ALL, new CellMapper());
    }

    @Override
    public boolean deleteCell(Cell cell) {
        return jdbcTemplate.update(SQL_DELETE_CELL, cell.getId()) > 0;
    }

    @Override
    public boolean updateCell(Cell cell) {
        return jdbcTemplate.update(SQL_UPDATE_CELL, cell.getLetter(), cell.getArrow(), cell.getQuestion(), cell.isTheLetter(), cell.isTheArrow(), cell.isTheQuestion(), cell.getId()) > 0;
    }

    @Override
    public boolean createCell(Cell cell) {
        return jdbcTemplate.update(SQL_INSERT_CELL, cell.getLetter(), cell.getArrow(), cell.getQuestion(), cell.isTheLetter(), cell.isTheArrow(), cell.isTheQuestion()) > 0;
    }
}