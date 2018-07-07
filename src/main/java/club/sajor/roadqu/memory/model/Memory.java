package club.sajor.roadqu.memory.model;

import club.sajor.roadqu.user.model.User;

import java.util.Date;

public class Memory extends User {
    private String tmid;
    private String tmtitle;
    private int memorytypeid;
    private String tmimg;
    private String userid;
    private String username;
    private Date tmtime;
    private String tmcontent;

    public String getTmid() {
        return tmid;
    }

    public void setTmid(String tmid) {
        this.tmid = tmid;
    }

    public String getTmtitle() {
        return tmtitle;
    }

    public void setTmtitle(String tmtitle) {
        this.tmtitle = tmtitle;
    }

    public int getMemorytypeid() {
        return memorytypeid;
    }

    public void setMemorytypeid(int memorytypeid) {
        this.memorytypeid = memorytypeid;
    }

    public String getTmimg() {
        return tmimg;
    }

    public void setTmimg(String tmimg) {
        this.tmimg = tmimg;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getTmtime() {
        return tmtime;
    }

    public void setTmtime(Date tmtime) {
        this.tmtime = tmtime;
    }

    public String getTmcontent() {
        return tmcontent;
    }

    public void setTmcontent(String tmcontent) {
        this.tmcontent = tmcontent;
    }
}
