package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-23:51
 */
@Data
@Table(name="score")
@NameStyle(Style.normal)
public class Score {

    private String a_id;
    private String r_id;
    private String p_id;
    private String degree;
    private String match_type;
    private String t_id;
    private String g_id;

}
