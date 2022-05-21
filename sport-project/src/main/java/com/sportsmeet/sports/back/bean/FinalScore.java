package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-24-19:38
 */
@Data
@Table(name="finalscore")
@NameStyle(Style.normal)
public class FinalScore {

    private String a_id;
    private String p_id;
    private String match_type;
    private String finaldegree;
    private String g_id;
    private String age_id;
    private String t_id;

}
