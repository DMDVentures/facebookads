view: outbound_clicks_ctr {
  sql_table_name: facebook_fivetran.facebook_fivetran_20_apr_18_outbound_clicks_ctr ;;

  dimension: _28_d_click {
    type: number
    sql: ${TABLE}._28_d_click ;;
  }

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: ad_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension_group: date {
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

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [ad.name, ad.id]
  }
}
