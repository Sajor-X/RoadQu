package club.sajor.roadqu.memory.dao;

import club.sajor.roadqu.memory.model.Memory;
import club.sajor.roadqu.memory.model.MemoryType;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MemoryDao {
    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid order by tmtime desc")
    List<Memory> selectAllMemory();

    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid and t.userid = #{userid} order by tmtime desc")
    List<Memory> selectAllMemoryByUserId(String userid);

    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid and tmid = #{tmid} limit 1")
    Memory selectMemoryById(String tmid);

    @Select("select * from memorytype")
    List<MemoryType> selectAllMemoryType();

    @Select("select tmid, tmtitle, memorytypeid, tmimg, t.userid, u.username, tmtime, tmcontent from travelmemory t, users u where t.userid = u.userid and memorytypeid = #{memorytypeid} order by tmtime desc limit #{page}, 4")
    List<Memory> selectMemoryByTypeId(@Param("memorytypeid") String memorytypeid, @Param("page") int page);
}
