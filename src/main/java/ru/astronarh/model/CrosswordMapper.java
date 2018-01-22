package ru.astronarh.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CrosswordMapper implements RowMapper<Crossword> {
    @Override
    public Crossword mapRow(ResultSet resultSet, int i) throws SQLException {
        Crossword crossword = new Crossword();
        crossword.setId(resultSet.getLong("id"));
        crossword.setRow(resultSet.getInt("row"));
        crossword.setColumns(resultSet.getInt("columns"));
        crossword.setIdBegin(resultSet.getInt("idBegin"));
        crossword.setIdEnd(resultSet.getInt("idEnd"));
        return crossword;
    }
}
