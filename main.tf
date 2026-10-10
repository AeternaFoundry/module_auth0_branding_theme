resource "auth0_branding_theme" "branding_themes" {
  for_each = var.branding_themes

  display_name = each.value.display_name

  borders {
    button_border_radius = each.value.borders.button_border_radius
    button_border_weight = each.value.borders.button_border_weight
    buttons_style        = each.value.borders.buttons_style
    input_border_radius  = each.value.borders.input_border_radius
    input_border_weight  = each.value.borders.input_border_weight
    inputs_style         = each.value.borders.inputs_style
    show_widget_shadow   = each.value.borders.show_widget_shadow
    widget_border_weight = each.value.borders.widget_border_weight
    widget_corner_radius = each.value.borders.widget_corner_radius
  }

  colors {
    base_focus_color          = each.value.colors.base_focus_color
    base_hover_color          = each.value.colors.base_hover_color
    body_text                 = each.value.colors.body_text
    captcha_widget_theme      = each.value.colors.captcha_widget_theme
    error                     = each.value.colors.error
    header                    = each.value.colors.header
    icons                     = each.value.colors.icons
    input_background          = each.value.colors.input_background
    input_border              = each.value.colors.input_border
    input_filled_text         = each.value.colors.input_filled_text
    input_labels_placeholders = each.value.colors.input_labels_placeholders
    links_focused_components  = each.value.colors.links_focused_components
    primary_button            = each.value.colors.primary_button
    primary_button_label      = each.value.colors.primary_button_label
    secondary_button_border   = each.value.colors.secondary_button_border
    secondary_button_label    = each.value.colors.secondary_button_label
    success                   = each.value.colors.success
    widget_background         = each.value.colors.widget_background
    widget_border             = each.value.colors.widget_border
  }

  fonts {
    body_text {
      bold = each.value.fonts.body_text.bold
      size = each.value.fonts.body_text.size
    }
    buttons_text {
      bold = each.value.fonts.buttons_text.bold
      size = each.value.fonts.buttons_text.size
    }
    font_url = each.value.fonts.font_url
    input_labels {
      bold = each.value.fonts.input_labels.bold
      size = each.value.fonts.input_labels.size
    }
    links {
      bold = each.value.fonts.links.bold
      size = each.value.fonts.links.size
    }
    links_style         = each.value.fonts.links_style
    reference_text_size = each.value.fonts.reference_text_size
    subtitle {
      bold = each.value.fonts.subtitle.bold
      size = each.value.fonts.subtitle.size
    }
    title {
      bold = each.value.fonts.title.bold
      size = each.value.fonts.title.size
    }
  }

  page_background {
    background_color     = each.value.page_background.background_color
    background_image_url = each.value.page_background.background_image_url
    page_layout          = each.value.page_background.page_layout
  }

  widget {
    header_text_alignment = each.value.widget.header_text_alignment
    logo_height           = each.value.widget.logo_height
    logo_position         = each.value.widget.logo_position
    logo_url              = each.value.widget.logo_url
    social_buttons_layout = each.value.widget.social_buttons_layout
  }

  dynamic "identifiers" {
    for_each = each.value.identifiers != null ? [each.value.identifiers] : []
    content {
      login_display    = identifiers.value.login_display
      otp_autocomplete = identifiers.value.otp_autocomplete
      phone_display {
        formatting = identifiers.value.phone_display.formatting
        masking    = identifiers.value.phone_display.masking
      }
    }
  }
}

