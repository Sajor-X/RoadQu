package club.sajor.roadqu.traveller.model;

import club.sajor.roadqu.user.model.User;

import java.sql.Timestamp;
import java.util.Date;

public class Traveller extends User {

    private String tkid;

    private String tktitle;

    private String tkdestination;

    private Timestamp tkbegintime;

    private Timestamp tkaftertime;

    private String userid;

    private Timestamp tktime;

    private String tkphone;

    private String tkdetails;

    private String tkimg;

    public String getTkimg() {
        return tkimg;
    }

    public void setTkimg(String tkimg) {
        this.tkimg = tkimg;
    }

    public String getTkid() {
        return tkid;
    }

    public void setTkid(String tkid) {
        this.tkid = tkid == null ? null : tkid.trim();
    }

    public String getTktitle() {
        return tktitle;
    }

    public void setTktitle(String tktitle) {
        this.tktitle = tktitle == null ? null : tktitle.trim();
    }

    public String getTkdestination() {
        return tkdestination;
    }

    public void setTkdestination(String tkdestination) {
        this.tkdestination = tkdestination == null ? null : tkdestination.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getTkphone() {
        return tkphone;
    }

    public void setTkphone(String tkphone) {
        this.tkphone = tkphone == null ? null : tkphone.trim();
    }

    public String getTkdetails() {
        return tkdetails;
    }

    public void setTkdetails(String tkdetails) {
        this.tkdetails = tkdetails == null ? null : tkdetails.trim();
    }

    public Timestamp getTkbegintime() {
        return tkbegintime;
    }

    public void setTkbegintime(Timestamp tkbegintime) {
        this.tkbegintime = tkbegintime;
    }

    public Timestamp getTkaftertime() {
        return tkaftertime;
    }

    public void setTkaftertime(Timestamp tkaftertime) {
        this.tkaftertime = tkaftertime;
    }

    public Timestamp getTktime() {
        return tktime;
    }

    public void setTktime(Timestamp tktime) {
        this.tktime = tktime;
    }
}