package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-15:18
 */
@Data
@Table(name="athlete")
@NameStyle(Style.normal)
public class Athlete {
    @Id
    private String a_id;
    private String a_name;
    private String t_id;
    private String g_id;
    private String age_id;
    private String age_sex;
    private String allDegree;

}
