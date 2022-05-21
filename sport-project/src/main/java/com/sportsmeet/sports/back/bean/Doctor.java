package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-22:40
 */
@Data
@Table(name="doctor")
@NameStyle(Style.normal)
public class Doctor {
    @Id
    private String d_id;
    private String t_id;
    private String d_name;
    private String d_phone;
    private String d_identity;
    ;
}
