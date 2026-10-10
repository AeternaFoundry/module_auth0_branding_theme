variable "branding_themes" {
  description = <<EOT
Map of branding_themes, attributes below
Required:
    - borders (block):
        - button_border_radius (optional)
        - button_border_weight (optional)
        - buttons_style (optional)
        - input_border_radius (optional)
        - input_border_weight (optional)
        - inputs_style (optional)
        - show_widget_shadow (optional)
        - widget_border_weight (optional)
        - widget_corner_radius (optional)
    - colors (block):
        - base_focus_color (optional)
        - base_hover_color (optional)
        - body_text (optional)
        - captcha_widget_theme (optional)
        - error (optional)
        - header (optional)
        - icons (optional)
        - input_background (optional)
        - input_border (optional)
        - input_filled_text (optional)
        - input_labels_placeholders (optional)
        - links_focused_components (optional)
        - primary_button (optional)
        - primary_button_label (optional)
        - secondary_button_border (optional)
        - secondary_button_label (optional)
        - success (optional)
        - widget_background (optional)
        - widget_border (optional)
    - fonts (block):
        - body_text (required, block):
            - bold (optional)
            - size (optional)
        - buttons_text (required, block):
            - bold (optional)
            - size (optional)
        - font_url (optional)
        - input_labels (required, block):
            - bold (optional)
            - size (optional)
        - links (required, block):
            - bold (optional)
            - size (optional)
        - links_style (optional)
        - reference_text_size (optional)
        - subtitle (required, block):
            - bold (optional)
            - size (optional)
        - title (required, block):
            - bold (optional)
            - size (optional)
    - page_background (block):
        - background_color (optional)
        - background_image_url (optional)
        - page_layout (optional)
    - widget (block):
        - header_text_alignment (optional)
        - logo_height (optional)
        - logo_position (optional)
        - logo_url (optional)
        - social_buttons_layout (optional)
Optional:
    - display_name
    - identifiers (block):
        - login_display (required)
        - otp_autocomplete (required)
        - phone_display (required, block):
            - formatting (required)
            - masking (required)
EOT

  type = map(object({
    display_name = optional(string)
    borders = object({
      button_border_radius = optional(number)
      button_border_weight = optional(number)
      buttons_style        = optional(string)
      input_border_radius  = optional(number)
      input_border_weight  = optional(number)
      inputs_style         = optional(string)
      show_widget_shadow   = optional(bool)
      widget_border_weight = optional(number)
      widget_corner_radius = optional(number)
    })
    colors = object({
      base_focus_color          = optional(string)
      base_hover_color          = optional(string)
      body_text                 = optional(string)
      captcha_widget_theme      = optional(string)
      error                     = optional(string)
      header                    = optional(string)
      icons                     = optional(string)
      input_background          = optional(string)
      input_border              = optional(string)
      input_filled_text         = optional(string)
      input_labels_placeholders = optional(string)
      links_focused_components  = optional(string)
      primary_button            = optional(string)
      primary_button_label      = optional(string)
      secondary_button_border   = optional(string)
      secondary_button_label    = optional(string)
      success                   = optional(string)
      widget_background         = optional(string)
      widget_border             = optional(string)
    })
    fonts = object({
      body_text = object({
        bold = optional(bool)
        size = optional(number)
      })
      buttons_text = object({
        bold = optional(bool)
        size = optional(number)
      })
      font_url = optional(string)
      input_labels = object({
        bold = optional(bool)
        size = optional(number)
      })
      links = object({
        bold = optional(bool)
        size = optional(number)
      })
      links_style         = optional(string)
      reference_text_size = optional(number)
      subtitle = object({
        bold = optional(bool)
        size = optional(number)
      })
      title = object({
        bold = optional(bool)
        size = optional(number)
      })
    })
    page_background = object({
      background_color     = optional(string)
      background_image_url = optional(string)
      page_layout          = optional(string)
    })
    widget = object({
      header_text_alignment = optional(string)
      logo_height           = optional(number)
      logo_position         = optional(string)
      logo_url              = optional(string)
      social_buttons_layout = optional(string)
    })
    identifiers = optional(object({
      login_display    = string
      otp_autocomplete = bool
      phone_display = object({
        formatting = string
        masking    = string
      })
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.buttons_style == null || (contains(["pill", "rounded", "sharp"], v.borders.buttons_style))
      )
    ])
    error_message = "must be one of: \"pill\", \"rounded\", \"sharp\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.button_border_radius == null || (v.borders.button_border_radius >= 1 && v.borders.button_border_radius <= 10)
      )
    ])
    error_message = "must be between 1 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.button_border_weight == null || (v.borders.button_border_weight >= 0 && v.borders.button_border_weight <= 10)
      )
    ])
    error_message = "must be between 0 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.inputs_style == null || (contains(["pill", "rounded", "sharp"], v.borders.inputs_style))
      )
    ])
    error_message = "must be one of: \"pill\", \"rounded\", \"sharp\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.input_border_radius == null || (v.borders.input_border_radius >= 0 && v.borders.input_border_radius <= 10)
      )
    ])
    error_message = "must be between 0 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.input_border_weight == null || (v.borders.input_border_weight >= 0 && v.borders.input_border_weight <= 3)
      )
    ])
    error_message = "must be between 0 and 3"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.widget_corner_radius == null || (v.borders.widget_corner_radius >= 0 && v.borders.widget_corner_radius <= 50)
      )
    ])
    error_message = "must be between 0 and 50"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.borders.widget_border_weight == null || (v.borders.widget_border_weight >= 0 && v.borders.widget_border_weight <= 10)
      )
    ])
    error_message = "must be between 0 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.colors.captcha_widget_theme == null || (contains(["auto", "dark", "light"], v.colors.captcha_widget_theme))
      )
    ])
    error_message = "must be one of: \"auto\", \"dark\", \"light\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.body_text.size == null || (v.fonts.body_text.size >= 0 && v.fonts.body_text.size <= 150)
      )
    ])
    error_message = "must be between 0 and 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.buttons_text.size == null || (v.fonts.buttons_text.size >= 0 && v.fonts.buttons_text.size <= 150)
      )
    ])
    error_message = "must be between 0 and 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.input_labels.size == null || (v.fonts.input_labels.size >= 0 && v.fonts.input_labels.size <= 150)
      )
    ])
    error_message = "must be between 0 and 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.links.size == null || (v.fonts.links.size >= 0 && v.fonts.links.size <= 150)
      )
    ])
    error_message = "must be between 0 and 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.links_style == null || (contains(["normal", "underlined"], v.fonts.links_style))
      )
    ])
    error_message = "must be one of: \"normal\", \"underlined\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.reference_text_size == null || (v.fonts.reference_text_size >= 12 && v.fonts.reference_text_size <= 24)
      )
    ])
    error_message = "must be between 12 and 24"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.subtitle.size == null || (v.fonts.subtitle.size >= 0 && v.fonts.subtitle.size <= 150)
      )
    ])
    error_message = "must be between 0 and 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.fonts.title.size == null || (v.fonts.title.size >= 75 && v.fonts.title.size <= 150)
      )
    ])
    error_message = "must be between 75 and 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.page_background.page_layout == null || (contains(["center", "left", "right"], v.page_background.page_layout))
      )
    ])
    error_message = "must be one of: \"center\", \"left\", \"right\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.widget.header_text_alignment == null || (contains(["center", "left", "right"], v.widget.header_text_alignment))
      )
    ])
    error_message = "must be one of: \"center\", \"left\", \"right\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.widget.logo_height == null || (v.widget.logo_height >= 1 && v.widget.logo_height <= 100)
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.widget.logo_position == null || (contains(["center", "left", "right", "none"], v.widget.logo_position))
      )
    ])
    error_message = "must be one of: \"center\", \"left\", \"right\", \"none\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.widget.social_buttons_layout == null || (contains(["bottom", "top"], v.widget.social_buttons_layout))
      )
    ])
    error_message = "must be one of: \"bottom\", \"top\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.identifiers == null || (contains(["unified", "separate"], v.identifiers.login_display))
      )
    ])
    error_message = "must be one of: \"unified\", \"separate\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.identifiers == null || (contains(["international", "regional"], v.identifiers.phone_display.formatting))
      )
    ])
    error_message = "must be one of: \"international\", \"regional\""
  }
  validation {
    condition = alltrue([
      for k, v in var.branding_themes : (
        v.identifiers == null || (contains(["mask_digits", "hide_country_code", "show_all"], v.identifiers.phone_display.masking))
      )
    ])
    error_message = "must be one of: \"mask_digits\", \"hide_country_code\", \"show_all\""
  }
}

