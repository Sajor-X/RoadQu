package club.sajor.roadqu.traveller.dao;

import club.sajor.roadqu.traveller.model.Traveller;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface TravellerDao {

    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid order by tktime desc")
    List<Traveller> selectAllTraveller();

    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid and tkdestination = #{tkdestionation} order by tktime desc")
    List<Traveller> selectTravellerByDestination(String tkdestination);

    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid and tkid = #{tkid} limit 1")
    Traveller selectTravellerById(String tkid);

    @SelectKey(statement = "select replace(uuid(), '-', '')", before=true, keyColumn="tkid", keyProperty="tkid", resultType=String.class)
    @Insert("INSERT INTO travelkeep VALUES (#{tkid}, #{tktitle}, #{tkdestination}, #{tkbegintime}, #{tkaftertime}, #{userid}, now(), #{tkphone}, #{tkdetails}, #{tkimg})")
    void addTraveller(Traveller traveller);

    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid and k.userid=#{userid} order by tktime desc limit #{page}, 7")
    List<Traveller> selectTravellerByUserId(@Param("userid") String userid, @Param("page") int page);

    @Delete("delete from travelkeep where tkid = #{tkid}")
    void deleteTravellerById(String tkid);

//    @Select("select k.*, u.username from travelkeep k, users u where u.userid=k.userid  ")
//    List<Traveller> selectTravellerByTime(Date datetime);

}
