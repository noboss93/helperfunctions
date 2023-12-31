# Loading Packages --------------------------------------------------------
library(ggtext)
library(tidyverse)
library(fontawesome)
library(palmerpenguins)

# Loading Fonts -----------------------------------------------------------


sysfonts::font_add(family = "Font Awesome 6 Brands",
                   regular = "FONTS/Font Awesome 6 Brands-Regular-400.otf")
showtext::showtext_auto()
showtext::showtext_opts(dpi=300)

# Color palette -----------------------------------------------------------
noah_green <- c("#58d68d","#2ecc71","#28b463","#239b56","#1d8348","#186a3b")
noah_yellow <- c("#f4d03f","#f1c40f","#d4ac0d","#b7950b","#9a7d0a","#7d6608")
noah_gray <- c("#cacfd2", "#bdc3c7", "#a6acaf", "#909497", "#797d7f", "#626567")


# Function ----------------------------------------------------------------
socials_caption <- function(icon_color = noah_green[6], font_color = noah_gray[6], twitter = "@noahbosshart", linkedin = "noahbosshart", github = "noboss93"){
  # adding social icons
  twitter_icon <- "&#xf099"
  linkedin_icon <- "&#xf08c"
  github_icon <- "&#xf09b"
  
  # creating caption strings
  twitter_caption <- ifelse(!is.null(twitter), glue::glue("<span style='font-family:\"Font Awesome 6 Brands\";color: {icon_color};'>{twitter_icon};</span> <span style = 'color: {font_color};'>{twitter}</span>"), "")
  linkedin_caption <- ifelse(!is.null(linkedin), glue::glue("<span style='font-family:\"Font Awesome 6 Brands\";color: {icon_color};'>{linkedin_icon};</span> <span style = 'color: {font_color};'>{linkedin}&nbsp;</span>"), "")
  github_caption <- ifelse(!is.null(github), glue::glue("<span style='font-family:\"Font Awesome 6 Brands\";color: {icon_color};'>{github_icon};</span> <span style = 'color: {font_color};'>{github}</span>"), "")
  
  
  complete_caption <- glue::glue(twitter_caption, linkedin_caption, github_caption, .sep = " ")
  return(complete_caption)
}
print("*** Function loaded ***", quote = FALSE)
print("use text size = 10 and margin(t = 5)", quote = FALSE)


# Example -----------------------------------------------------------------
palmerpenguins::penguins %>%
  ggplot(aes(x = flipper_length_mm, y = body_mass_g, color = island, shape = island))+
  geom_point()+
  scale_color_manual(values = c(noah_green[2], noah_yellow[2], noah_gray[5]))+
  labs(title = "Add socials as subtitles or as captions", caption = socials_caption(), subtitle = socials_caption())+
  theme(plot.caption = element_textbox_simple(size = 10, margin = margin(t = 5)),
        plot.subtitle = element_textbox_simple(size = 10, margin = margin(b = 5)),
        legend.position = c(0.2,0.8))

# ggsave("plots/captions_example.png", width  = 150, height  = 150, units = "mm")

