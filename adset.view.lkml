view: adset {
  sql_table_name: facebook_fivetran.adset ;;

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

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
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
      campaign.name,
      campaign.id,
      ad.count,
      facebook_fivetran_20_apr_18.count
    ]
  }
}
