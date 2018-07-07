package club.sajor.roadqu.memory.service;

import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;

import java.util.List;

public interface MemoryService {
    List<Memory> selectAllMemory();
    List<Memory> selectAllMemoryByUserid(String userid);
    Memory selectMemoryByid(String tmid);
    List<MemoryType> selectAllMemoryType();
}
