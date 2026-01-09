## Leer los datos
unemployment <- read.csv("unemployed.csv", sep = ",", fileEncoding = "UTF-8")



# Convertir los datos de "Month" a un factor con el orden definido
unemployment$Month <- ordered(unemployment$Month, levels =c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

# Graficar
ggplot(unemployment, aes(x = Month, y = Number, fill = factor(Year))) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = comma(Number)), vjust = -0.5, size = 2, position = position_dodge(width = 0.9)) +
  labs(x = "Mes", y = "Número de desempleados", title = "Desempleo por mes y año (2021-2023)", fill = "Año") +
  scale_fill_manual(values = c("#e38544", "#8aafdd", "#649e85")) +  
  theme_minimal() +
  theme(
    plot.background = element_rect(fill = "#fffefc", color = NA), 
    panel.grid.major = element_blank(), 
    axis.line = element_line(color = "#fffefc"), 
    text = element_text(family = "Oswald", size = 15, color = "black"), 
    axis.text.x = element_text(angle = 45, hjust = 1) 
  )
