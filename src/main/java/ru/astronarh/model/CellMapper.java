package ru.astronarh.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CellMapper implements RowMapper<Cell> {
    @Override
    public Cell mapRow(ResultSet resultSet, int i) throws SQLException {
        Cell cell = new Cell();
        cell.setId(resultSet.getLong("id"));
        cell.setLetter(resultSet.getString("letter"));
        cell.setArrow(resultSet.getInt("arrow"));
        cell.setQuestion(resultSet.getString("question"));
        cell.setTheLetter(resultSet.getBoolean("theLetter"));
        cell.setTheArrow(resultSet.getBoolean("theArrow"));
        cell.setTheQuestion(resultSet.getBoolean("theQuestion"));
        /*cell.setLetter((boolean) resultSet.getBoolean("isLetter"));
        cell.setArrow((boolean) resultSet.getBoolean("isArrow"));
        cell.setQuestion((boolean) resultSet.getBoolean("isQuestion"));*/
        return cell;
    }
}
