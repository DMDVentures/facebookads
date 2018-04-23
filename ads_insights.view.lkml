view: ad_insights {
  derived_table: {
    sql: SELECT

ad_id,
adset_id,
campaign_id,
date_start,
MAX(account_id) as account_id,
MAX(campaign_name) as campaign_name,
MAX(clicks) as clicks,
MAX(cost_per_total_action) as cost_per_total_action,
MAX(cpc) as cpc,
MAX(cpm) as cpm,
MAX(cpp) as cpp,
MAX(ctr) as ctr,
MAX(date_stop) as date_stop,
MAX(frequency) as frequency,
MAX(impressions) as impressions,
MAX(reach) as reach,
MAX(spend) as spend,
MAX(total_action_value) as total_action_value,
MAX(total_actions) as total_actions,
MAX(ads_insights__website_ctr.value) as website_clicks,
MAX(total_unique_actions) as total_unique_actions,
MAX(inline_link_clicks) as inline_link_clicks,
MAX(inline_link_click_ctr) as inline_link_click_ctr,
MAX(cost_per_inline_link_click) as cost_per_inline_link_click


FROM `looker-31dover.facebook_instagram.ads_insights` as ads_insights
LEFT JOIN UNNEST(ads_insights.website_ctr) as ads_insights__website_ctr
GROUP BY ad_id, adset_id, campaign_id, date_start ;;
  }

  ## STANDARD FIELDS

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
#     sql: ${campaigns.name} ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_total_action {
    type: number
    sql: ${TABLE}.cost_per_total_action ;;
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

  dimension_group: date_start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
    value_format_name: usd
  }

  dimension: total_action_value {
    type: number
    sql: ${TABLE}.total_action_value ;;
  }

  dimension: actions {
    type: number
    sql: ${TABLE}.total_actions ;;
  }

  dimension: website_clicks {
    type: number
    sql: ${TABLE}.website_clicks ;;
  }

  ## AGGREGATED MEASURES

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_actions {
    type: sum
    sql: ${TABLE}.total_actions ;;
    drill_fields: [campaign_id]
  }

  measure: total_reach {
    type: sum
    sql: ${TABLE}.reach ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: total_impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: people_taking_action {
    description: "The number of unique people who took an action such as liking your Page or installing your app as a result of your ad. For example, if the same person likes and comments on a post, they will be counted as 1 unique person."
    type: sum
    sql: ${TABLE}.total_unique_actions ;;
  }

  measure: total_inline_link_clicks {
    type: sum
    sql: ${TABLE}.inline_link_clicks ;;
  }

  #### NOTE: you will need to use the frequency column that appears in your dataset.

  measure: avg_frequency {
    description: "the average number of times your ad was served to each person"
    type: average
    sql: ${TABLE}.frequency ;;
  }

  #### NOTE: you will need to use the cpm column that appears in your dataset.

  measure: avg_cpm {
    description: "The average cost you've paid to have 1,000 impressions on your ad."
    type: average
    sql: ${TABLE}.cpm ;;
    value_format_name: usd
  }

  #### NOTE: you will need to use the cpp column that appears in your dataset.

  measure: avg_cpp {
    description: "The average cost you've paid to have your ad served to 1,000 unique people."
    type: average
    sql: ${TABLE}.cpp ;;
    value_format_name: usd
  }

  #### NOTE: you will need to use the spend column that appears in your dataset.

  measure: total_spend {
    type: sum
    sql: ${TABLE}.spend ;;
    value_format_name: usd
  }

  #### NOTE: you will need to use the ctr column that appears in your dataset.

  measure: avg_ctr {
    type: average
    sql: ${TABLE}.ctr ;;
  }

  #### NOTE: you will need to use the cpc column that appears in your dataset.

  measure: avg_cpc {
    type: average
    sql: ${TABLE}.cpc ;;
    value_format_name: usd
  }

  #### NOTE: you will need to use the inline link click ctr column that appears in your dataset.

  measure: avg_inline_link_click_ctr {
    type: average
    sql: ${TABLE}.inline_link_click_ctr ;;
  }

  #### NOTE: you will need to use the cost per inline link click column that appears in your dataset.

  measure: avg_cost_per_inline_link_click {
    type: average
    sql: ${TABLE}.cost_per_inline_link_click ;;
  }
}
