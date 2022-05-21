package com.sportsmeet.sports.base.bean;

import lombok.Data;

/**
 * @author XYX
 * @create 2021-11-16-21:37
 * 给客户端返回消息的Bean对象，返回数据(泛型)
 */

@Data
public class ResultVo {

    private String mess;//给客户端的消息
    private boolean isOk;//用户操作是否成功

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public boolean isOk() {
        return isOk;
    }

    public void setOk(boolean ok) {
        isOk = ok;
    }
}
