package club.sajor.roadqu.memory.service.impl;

import club.sajor.roadqu.memory.dao.MemoryDao;
import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;
import club.sajor.roadqu.memory.service.MemoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "memoryService")
public class MemoryServiceImpl implements MemoryService {

    @Autowired
    private MemoryDao memoryDao;

    @Override
    public List<Memory> selectAllMemory() {
        List<Memory> memories = memoryDao.selectAllMemory();
        return memories;
    }

    @Override
    public List<Memory> selectAllMemoryByUserid(String userid) {
        List<Memory> memories = memoryDao.selectAllMemoryByUserid(userid);
        return memories;
    }

    @Override
    public Memory selectMemoryByid(String tmid) {
        Memory memory = memoryDao.selectMemoryByid(tmid);
        return memory;
    }

    @Override
    public List<MemoryType> selectAllMemoryType() {
        List<MemoryType> memoryTypeList = memoryDao.selectAllMemoryType();
        return memoryTypeList;
    }
}
