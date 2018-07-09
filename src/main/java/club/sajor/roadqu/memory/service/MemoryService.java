package club.sajor.roadqu.memory.service;

import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;

import java.util.List;

public interface MemoryService {
    List<Memory> selectAllMemory();

    List<Memory> selectMemoryByUserId(String userid, int page);

    Memory selectMemoryById(String tmid);

    List<MemoryType> selectAllMemoryType();

    List<Memory> selectMemoryByTypeId(String memorytypeid, int page);

    void addMemory(Memory memory);
}
