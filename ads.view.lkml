view: ads {
  derived_table: {
    sql: SELECT

id,
MAX(account_id) as account_id,
MAX(adset_id) as adset_id,
MAX(creative.id) as creative_id,
MAX(campaign_id) as campaign_id,
MAX(created_time) as created_time,
MAX(effective_status) as effective_status,
MAX(name) as name,
MAX(targeting.age_max) as targeting_age_max,
MAX(targeting.age_min) as targeting_age_min


FROM `looker-31dover.facebook_instagram.ads` GROUP BY id ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  #   - dimension: bid_info__actions
  #     description:
  #     type: number
  #     sql: ${TABLE}.bid_info__actions
  #
  #   - dimension: bid_info__clicks
  #     description:
  #     type: number
  #     sql: ${TABLE}.bid_info__clicks
  #
  #   - dimension: bid_info__reach
  #     description:
  #     type: number
  #     sql: ${TABLE}.bid_info__reach
  #
  #   - dimension: bid_type
  #     description:
  #     type: string
  #     sql: ${TABLE}.bid_type
  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;

  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_time ;;
  }

  dimension: effective_status {
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: targeting__age_max {
    type: number
    sql: ${TABLE}.targeting_age_max ;;
  }

  dimension: targeting__age_min {
    type: number
    sql: ${TABLE}.targeting_age_min ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
