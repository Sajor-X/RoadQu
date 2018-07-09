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
    public List<Memory> selectMemoryByUserId(String userid, int page) {
        List<Memory> memories = memoryDao.selectMemoryByUserId(userid, page);
        return memories;
    }

    @Override
    public Memory selectMemoryById(String tmid) {
        Memory memory = memoryDao.selectMemoryById(tmid);
        return memory;
    }

    @Override
    public List<MemoryType> selectAllMemoryType() {
        List<MemoryType> memoryTypeList = memoryDao.selectAllMemoryType();
        return memoryTypeList;
    }

    @Override
    public List<Memory> selectMemoryByTypeId(String memorytypeid, int page) {
        return memoryDao.selectMemoryByTypeId(memorytypeid, page);
    }

    @Override
    public void addMemory(Memory memory) {
        memoryDao.addMemory(memory);
    }

    @Override
    public void deleteMemoryById(String tmid) {
        memoryDao.deleteMemoryById(tmid);
    }

    @Override
    public List<Memory> selectMemoryByKey(String key) {
        return memoryDao.selectMemoryByKey(key);
    }
}
