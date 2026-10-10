output "branding_themes_id" {
  description = "Map of id values across all branding_themes, keyed the same as var.branding_themes except keys with no id are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "branding_themes_borders" {
  description = "Map of borders values across all branding_themes, keyed the same as var.branding_themes except keys with no borders are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.borders) if v.borders != null && length(v.borders) > 0 }
}
output "branding_themes_colors" {
  description = "Map of colors values across all branding_themes, keyed the same as var.branding_themes except keys with no colors are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.colors) if v.colors != null && length(v.colors) > 0 }
}
output "branding_themes_display_name" {
  description = "Map of display_name values across all branding_themes, keyed the same as var.branding_themes except keys with no display_name are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "branding_themes_fonts" {
  description = "Map of fonts values across all branding_themes, keyed the same as var.branding_themes except keys with no fonts are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.fonts) if v.fonts != null && length(v.fonts) > 0 }
}
output "branding_themes_identifiers" {
  description = "Map of identifiers values across all branding_themes, keyed the same as var.branding_themes except keys with no identifiers are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.identifiers) if v.identifiers != null && length(v.identifiers) > 0 }
}
output "branding_themes_page_background" {
  description = "Map of page_background values across all branding_themes, keyed the same as var.branding_themes except keys with no page_background are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.page_background) if v.page_background != null && length(v.page_background) > 0 }
}
output "branding_themes_widget" {
  description = "Map of widget values across all branding_themes, keyed the same as var.branding_themes except keys with no widget are omitted"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.widget) if v.widget != null && length(v.widget) > 0 }
}

