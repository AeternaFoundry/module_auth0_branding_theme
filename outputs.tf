output "branding_themes_id" {
  description = "Map of id values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => v.id }
}
output "branding_themes_borders" {
  description = "Map of borders values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.borders) }
}
output "branding_themes_colors" {
  description = "Map of colors values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.colors) }
}
output "branding_themes_display_name" {
  description = "Map of display_name values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => v.display_name }
}
output "branding_themes_fonts" {
  description = "Map of fonts values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.fonts) }
}
output "branding_themes_identifiers" {
  description = "Map of identifiers values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.identifiers) }
}
output "branding_themes_page_background" {
  description = "Map of page_background values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.page_background) }
}
output "branding_themes_widget" {
  description = "Map of widget values across all branding_themes, keyed the same as var.branding_themes"
  value       = { for k, v in auth0_branding_theme.branding_themes : k => one(v.widget) }
}

