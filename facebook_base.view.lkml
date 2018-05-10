view: facebook_base {
  sql_table_name: facebook_fivetran.facebook_fivetran_20_apr_18 ;;

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
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

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    sql: ${TABLE}.adset_name ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}.cpc ;;
  }

  dimension: cpm {
    type: number
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: social_clicks {
    type: number
    sql: ${TABLE}.social_clicks ;;
  }

  dimension: social_impressions {
    type: number
    sql: ${TABLE}.social_impressions ;;
  }

  dimension: social_reach {
    type: number
    sql: ${TABLE}.social_reach ;;
  }

  dimension: social_spend {
    type: number
    sql: ${TABLE}.social_spend ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      adset_name,
      ad_name,
      campaign_name,
      account_name,
      ad.name,
      ad.id,
      account.name,
      account.id,
      adset.name,
      adset.id,
      campaign.name,
      campaign.id
    ]
  }
}
