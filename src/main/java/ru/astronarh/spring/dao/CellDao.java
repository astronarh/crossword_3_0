package ru.astronarh.spring.dao;

import ru.astronarh.model.Cell;

import java.util.List;

public interface CellDao {
    Cell getCellById(Long id);

    List<Cell> getCellsBetweenValues(long idBegin, long idEnd);

    boolean deleteCellsBetweenValues(long idBegin, long idEnd);

    List<Cell> getAllCells();

    boolean deleteCell(Cell cell);

    boolean updateCell(Cell cell);

    boolean createCell(Cell cell);
}
