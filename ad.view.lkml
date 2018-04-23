view: ad {
  sql_table_name: facebook_fivetran.ad ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: adset_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.adset_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      adset.name,
      adset.id,
      facebook_fivetran_20_apr_18.count,
      facebook_fivetran_20_apr_18_actions.count,
      facebook_fivetran_20_apr_18_outbound_clicks.count,
      facebook_fivetran_20_apr_18_outbound_clicks_ctr.count,
      facebook_fivetran_20_apr_18_website_ctr.count,
      facebook_fivetran_20_apr_18_website_purchase_roas.count
    ]
  }
}
