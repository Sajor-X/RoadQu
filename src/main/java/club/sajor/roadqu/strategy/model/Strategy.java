package club.sajor.roadqu.strategy.model;

import java.util.Date;

public class Strategy {

    private String tsid;

    private String tstitle;

    private String tsapptime;

    private String tspppeople;

    private String tsimg;

    private Integer stypesid;

    private String tsintro;

    private String tsequip;

    private String tsnotice;

    private Integer tswant;

    private Integer tsbeen;

    private String tsname;

    private String tsaddress;

    private String tsdescribe;

    public String getTsid() {
        return tsid;
    }

    public void setTsid(String tsid) {
        this.tsid = tsid;
    }

    public String getTstitle() {
        return tstitle;
    }

    public void setTstitle(String tstitle) {
        this.tstitle = tstitle;
    }

    public String getTsapptime() {
        return tsapptime;
    }

    public void setTsapptime(String tsapptime) {
        this.tsapptime = tsapptime;
    }

    public String getTspppeople() {
        return tspppeople;
    }

    public void setTspppeople(String tspppeople) {
        this.tspppeople = tspppeople;
    }

    public String getTsimg() {
        return tsimg;
    }

    public void setTsimg(String tsimg) {
        this.tsimg = tsimg;
    }

    public Integer getStypesid() {
        return stypesid;
    }

    public void setStypesid(Integer stypesid) {
        this.stypesid = stypesid;
    }

    public String getTsintro() {
        return tsintro;
    }

    public void setTsintro(String tsintro) {
        this.tsintro = tsintro;
    }

    public String getTsequip() {
        return tsequip;
    }

    public void setTsequip(String tsequip) {
        this.tsequip = tsequip;
    }

    public String getTsnotice() {
        return tsnotice;
    }

    public void setTsnotice(String tsnotice) {
        this.tsnotice = tsnotice;
    }

    public Integer getTswant() {
        return tswant;
    }

    public void setTswant(Integer tswant) {
        this.tswant = tswant;
    }

    public Integer getTsbeen() {
        return tsbeen;
    }

    public void setTsbeen(Integer tsbeen) {
        this.tsbeen = tsbeen;
    }

    public String getTsname() {
        return tsname;
    }

    public void setTsname(String tsname) {
        this.tsname = tsname;
    }

    public String getTsaddress() {
        return tsaddress;
    }

    public void setTsaddress(String tsaddress) {
        this.tsaddress = tsaddress;
    }

    public String getTsdescribe() {
        return tsdescribe;
    }

    public void setTsdescribe(String tsdescribe) {
        this.tsdescribe = tsdescribe;
    }

    @Override
    public String toString() {
        return "Travelstrategy [tsid=" + tsid + ", tstitle=" + tstitle
                + ", tsapptime=" + tsapptime + ", tspppeople=" + tspppeople
                + ", tsimg=" + tsimg + ", stypesid=" + stypesid + ", tsintro="
                + tsintro + ", tsequip=" + tsequip + ", tsnotice=" + tsnotice
                + ", tswant=" + tswant + ", tsbeen=" + tsbeen + ", tsname="
                + tsname + ", tsaddress=" + tsaddress + ", tsdescribe="
                + tsdescribe + "]";
    }


}