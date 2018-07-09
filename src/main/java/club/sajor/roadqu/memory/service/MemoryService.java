package club.sajor.roadqu.memory.service;

import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;

import java.util.List;

public interface MemoryService {
    List<Memory> selectAllMemory();

    List<Memory> selectAllMemoryByUserId(String userid);

    Memory selectMemoryById(String tmid);

    List<MemoryType> selectAllMemoryType();

    List<Memory> selectMemoryByTypeId(String memorytypeid, int page);
}
