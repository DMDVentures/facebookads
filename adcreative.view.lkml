view: adcreative {
  derived_table: {
    sql: SELECT
        adcreative.id  AS id,
        MAX(adcreative.instagram_actor_id)  AS adcreative_instagram_actor_id,
        MAX(adcreative.call_to_action_type)  AS adcreative_call_to_action_type,
        MAX(adcreative.image_hash)  AS adcreative_image_hash,
        MAX(adcreative.image_url)  AS adcreative_image_url,
        MAX(adcreative.link_url)  AS adcreative_link_url,
        MAX(adcreative.name)  AS adcreative_name,
        MAX(adcreative.object_story_id)  AS adcreative_object_story_id,
        MAX(adcreative__object_story_spec.instagram_actor_id)  AS adcreative__object_story_spec_instagram_actor_id,
        MAX(adcreative__object_story_spec__link_data.attachment_style)  AS adcreative__object_story_spec__link_data_attachment_style,
        MAX(adcreative__object_story_spec__link_data__call_to_action.type)  AS adcreative__object_story_spec__link_data__call_to_action_type,
        MAX(adcreative__object_story_spec__link_data__call_to_action__value.link)  AS adcreative__object_story_spec__link_data__call_to_action__value_link,
        MAX(adcreative__object_story_spec__link_data.caption)  AS adcreative__object_story_spec__link_data_caption,
        MAX(adcreative__object_story_spec__link_data.description)  AS adcreative__object_story_spec__link_data_description,
        MAX(adcreative__object_story_spec__link_data.image_hash)  AS adcreative__object_story_spec__link_data_image_hash,
        MAX(adcreative__object_story_spec__link_data.link)  AS adcreative__object_story_spec__link_data_link,
        MAX(adcreative__object_story_spec__link_data.message)  AS adcreative__object_story_spec__link_data_message,
        MAX(adcreative__object_story_spec__link_data.multi_share_end_card)  AS adcreative__object_story_spec__link_data_multi_share_end_card,
        MAX(adcreative__object_story_spec__link_data.multi_share_optimized)  AS adcreative__object_story_spec__link_data_multi_share_optimized,
        MAX(adcreative__object_story_spec__link_data.name)  AS adcreative__object_story_spec__link_data_name,
        MAX(adcreative__object_story_spec__link_data.picture)  AS adcreative__object_story_spec__link_data_picture,
        MAX(adcreative__object_story_spec.page_id)  AS adcreative__object_story_spec_page_id,
        MAX(adcreative.instagram_permalink_url)  AS adcreative_instagram_permalink_url,
        MAX(adcreative.title)  AS adcreative_title,
        MAX(adcreative.body)  AS adcreative_body,
        MAX(adcreative.link_og_id)  AS adcreative_link_og_id,
        MAX(adcreative.account_id)  AS adcreative_account_id,
        MAX(adcreative.status)  AS adcreative_status,
        MAX(adcreative.effective_instagram_story_id)  AS adcreative_effective_instagram_story_id,
        MAX(adcreative.effective_object_story_id)  AS adcreative_effective_object_story_id,
        MAX(adcreative.object_type)  AS adcreative_object_type,
        MAX(adcreative.thumbnail_url)  AS adcreative_thumbnail_url
      FROM facebook_instagram.adcreative  AS adcreative
      LEFT JOIN UNNEST([adcreative.object_story_spec]) as adcreative__object_story_spec
      LEFT JOIN UNNEST([adcreative__object_story_spec.link_data]) as adcreative__object_story_spec__link_data
      LEFT JOIN UNNEST([adcreative__object_story_spec__link_data.call_to_action]) as adcreative__object_story_spec__link_data__call_to_action
      LEFT JOIN UNNEST([adcreative__object_story_spec__link_data__call_to_action.value]) as adcreative__object_story_spec__link_data__call_to_action__value

      GROUP BY 1 ;;
  }

    dimension: actor_id {
      type: string
      sql: ${TABLE}.actor_id;;
    }

    dimension: call_to_action_type {
      type: string
      sql: ${TABLE}.call_to_action_type;;
    }

    dimension: id {
      type: string
      sql: ${TABLE}.id;;
    }

    dimension: image_hash {
      type: string
      sql: ${TABLE}.image_hash;;
    }

    dimension: image_url {
      type: string
      sql: ${TABLE}.image_url;;
    }

    dimension: link_url {
      type: string
      sql: ${TABLE}.link_url;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name;;
    }

    dimension: object_story_id {
      type: string
      sql: ${TABLE}.object_story_id;;
    }

    dimension: object_story_spec__instagram_actor_id {
      type: string
      sql: ${TABLE}.object_story_spec__instagram_actor_id;;
    }

    dimension: object_story_spec__link_data__attachment_style {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__attachment_style;;
    }

    dimension: object_story_spec__link_data__call_to_action__type {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__call_to_action__type;;
    }

    dimension: object_story_spec__link_data__call_to_action__value__link {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__call_to_action__value__link;;
    }

    dimension: object_story_spec__link_data__caption {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__caption;;
    }

    dimension: object_story_spec__link_data__description {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__description;;
    }

    dimension: object_story_spec__link_data__image_hash {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__image_hash;;
    }

    dimension: object_story_spec__link_data__link {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__link;;
    }

    dimension: object_story_spec__link_data__message {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__message;;
    }

    dimension: object_story_spec__link_data__multi_share_end_card {
      type: yesno
      sql: ${TABLE}.object_story_spec__link_data__multi_share_end_card;;
    }

    dimension: object_story_spec__link_data__multi_share_optimized {
      type: yesno
      sql: ${TABLE}.object_story_spec__link_data__multi_share_optimized;;
    }

    dimension: object_story_spec__link_data__name {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__name;;
    }

    dimension: object_story_spec__link_data__picture {
      type: string
      sql: ${TABLE}.object_story_spec__link_data__picture;;
    }

    dimension: object_story_spec__page_id {
      type: string
      sql: ${TABLE}.object_story_spec__page_id;;
    }

    dimension: object_url {
      type: string
      sql: ${TABLE}.object_url;;
    }

    dimension: title {
      type: string
      sql: ${TABLE}.title;;
    }

    dimension: body {
      type: string
      sql: ${TABLE}.body;;
    }

    dimension: link_og_id {
      type: string
      sql: ${TABLE}.link_og_id;;
    }

    dimension: account_id {
      type: string
      sql: ${TABLE}.account_id;;
    }

    dimension: use_page_actor_override {
      type: yesno
      sql: ${TABLE}.use_page_actor_override;;
    }

    dimension: status {
      type: string
      sql: ${TABLE}.status;;
    }

    dimension: effective_instagram_story_id {
      type: string
      sql: ${TABLE}.effective_instagram_story_id;;
    }

    dimension: effective_object_story_id {
      type: string
      sql: ${TABLE}.effective_object_story_id;;
    }

    dimension: object_type {
      type: string
      sql: ${TABLE}.object_type;;
    }

    dimension: thumbnail_url {
      type: string
      sql: ${TABLE}.thumbnail_url;;
    }

    dimension: instagram_actor_id {
      type: string
      sql: ${TABLE}.instagram_actor_id;;
    }

    dimension: instagram_permalink_url {
      type: string
      sql: ${TABLE}.instagram_permalink_url;;
  }
}
