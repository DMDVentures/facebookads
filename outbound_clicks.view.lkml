view: outbound_clicks {
  sql_table_name: facebook_fivetran.facebook_fivetran_20_apr_18_outbound_clicks ;;

  dimension: primary_key {
    type: string
    sql: CONCAT(${ad_id}, CAST(${date_raw} as STRING)) ;;
    hidden: yes
    primary_key: yes
  }

  dimension: action_type {
    hidden: yes
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: ad_id {
    hidden: yes
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension_group: date {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
    hidden: yes
  }

  dimension: _28_d_click {
    type: number
    sql: ${TABLE}._28_d_click ;;
    hidden: yes
  }

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [ad.name, ad.id]
    hidden: yes
  }

  measure: number_of_outbound_clicks {
    type: number
    sql: ${value} ;;
    view_label: "Facebook"
  }
}
