package club.sajor.roadqu.memory.dao;

import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface MemoryDao {
    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid order by tmtime desc")
    List<Memory> selectAllMemory();

    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid and t.userid = #{userid} order by tmtime desc limit #{page}, 4")
    List<Memory> selectMemoryByUserId(@Param("userid") String userid,  @Param("page") int page);

    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid and tmid = #{tmid} limit 1")
    Memory selectMemoryById(String tmid);

    @Select("select * from memorytype")
    List<MemoryType> selectAllMemoryType();

    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid and memorytypeid = #{memorytypeid} order by tmtime desc limit #{page}, 4")
    List<Memory> selectMemoryByTypeId(@Param("memorytypeid") String memorytypeid, @Param("page") int page);

    @SelectKey(statement = "select replace(uuid(), '-', '')", before=true, keyColumn="tmid", keyProperty="tmid", resultType=String.class)
    @Insert("INSERT INTO travelmemory VALUES (#{tmid}, #{tmtitle}, #{memorytypeid}, #{tmimg}, #{userid}, now(), #{tmcontent})")
    void addMemory(Memory memory);

    @Delete("delete from travelmemory where tmid = #{tmid}")
    void deleteMemoryById(String tmid);

    @Select("select m.*, u.username from travelmemory m, users u where m.userid=u.userid and tmtitle like CONCAT('%',#{key, jdbcType = VARCHAR},'%')")
    List<Memory> selectMemoryByKey(String key);
}
