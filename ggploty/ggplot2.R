library(ggplot2)

chart_src <- readr::read_csv2("./ggploty/ggplot2.csv")


ggplot(data = chart_src, aes(x = last_updated, 
                             y = 1,
                             color = pkg,
                             label = version)) +
  geom_jitter(position = position_jitter(seed = 24),
              color = "red",
              pch = 4) +
  geom_text(position = position_jitter(seed = 24),
            vjust = -1) +
  scale_x_date(limits = c(as.Date("2005-01-01"),
                          as.Date("2025-01-01")),
               date_minor_breaks = "year") +
  labs(title = "ggplot versions in time") +
  theme(axis.title = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        legend.position = "none",
        plot.title = element_text(family = "Permanent Marker",
                                  hjust = 1/2,
                                  size = 30,
                                  color = "grey30"))

ggsave("./ggploty/ggplot.png", 
       width = 15,
       height = 7.5,
       dpi = 100)