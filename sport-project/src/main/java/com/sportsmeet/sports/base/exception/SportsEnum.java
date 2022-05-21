package com.sportsmeet.sports.base.exception;


public enum SportsEnum {

    //第一个001:用户登录模块 第二个001:登录中验证码错误情况
    USER_LOGIN_CODE("001-001","验证码输入错误"),
    USER_LOGIN_ACCOUNT("001-002","用户名或者密码错误"),
    USER_VERIFY_PASS("001-003","输入的旧密码错误"),
    USER_UPDATE("001-004","输入的旧密码错误"),
    MATCHSCHDULE_SAVE("002-001","添加赛程失败"),
    MATCHSCHDULE_DELETE("002-002","删除赛程失败"),
    MATCHSCHDULE_ADD("002-003","添加运动员失败"),
    TEAM_DELETE("003-001","删除运动员失败"),
    LEADER_ADD("004-001","添加领队失败"),
    LEADER_DELETE("004-002","删除领队失败"),
    DOCTOR_ADD("005-001","添加队医失败"),
    DOCTOR_DELETE("005-002","删除队医失败"),
    REFEREE_GRADE("006-001","成绩录入有误");


    private String typeCode;//属于哪个模块下的操作失败code
    private String message;//具体错误消息

    SportsEnum(String typeCode, String message) {
        this.typeCode = typeCode;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }
}
