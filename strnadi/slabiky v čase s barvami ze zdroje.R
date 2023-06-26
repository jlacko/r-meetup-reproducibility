library(dplyr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(wesanderson)


src <- readr::read_tsv("./strnadi/SIT.txt") %>% 
  cbind(`2022` = 0) %>% 
  pivot_longer(cols = starts_with("2"), names_to = "year", values_to = "value") %>% 
  mutate(year = ifelse(year == "20112", "2012", year)) %>% # sauber machen! vycistit...
  mutate(month = ym(paste0(year, "-07"))-years(1))

# parametry: vektory musi mit prvku jako skupin, barva jako kategorie slabik
vektor_pruhlednosti <- c(0, 1/5, 1/5, 2/3, 2/3, 1)
vektor_tloustek <- c(0, 1, 1, 2, 3, 4)
paleta_barev <- wesanderson::wes_palette("Darjeeling1", length(unique(src$category)), type = "continuous")

obrazek <- ggplot(data = src, aes(x = Syllable, y = month, color = category, size = factor(value, levels = 0:5), group = Syllable)) +
  geom_line() +
  scale_size_manual(values = vektor_tloustek) +
  scale_y_date(date_breaks = "1 year", labels = scales::date_format("%Y")) +
  scale_colour_manual(values = paleta_barev) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        axis.title = element_blank(),
        panel.border = element_blank(),
        panel.grid.major.x = element_line(color = "gray95"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none") 

ggsave("./strnadi/vystup.png", 
       plot = obrazek,
       width = 18,
       height = 6,
       dpi = 100)
