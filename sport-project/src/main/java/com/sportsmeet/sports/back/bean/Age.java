package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-22:32
 */
@Data
@Table(name="age")
@NameStyle(Style.normal)
public class Age {
   @Id
   private String age_id;
   private String age_name;
   private String age_sex;
;
}
