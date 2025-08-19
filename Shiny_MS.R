#--------------
# install.packages("shiny")

# Cargamos la librería shiny----------------------------------------------------
library(shiny)

# Definimos la interfaz de usuario (UI) # Preocupaciones con la capacidad de UX
ui <- fluidPage(

  # Título
  titlePanel("Encuesta sobre la gestión del riesgo de esclavitud moderna"),

  # Definimos liste de preguntas.... la pregunta y las opciones de respuesta
  radioButtons(inputId = "respuesta",
               label = "Asignación de roles a nivel de la Junta para supervisar la gestión del riesgo de esclavitud moderna, el desarrollo de estrategias y su implementación.",
               choices = c("Completamente implementado",
                           "Parcialmente implementado",
                           "No implementado"),
               selected = NULL),

  # Configuración de botones de acción para enviar la respuesta...Agregar información
  actionButton(inputId = "submit", label = "Enviar respuesta")

)

# Configuración del  el servidor
server <- function(input, output) {

  # Función reactiva para capturar la respuesta enviada
  observeEvent(input$submit, {
    respuesta <- input$respuesta
    # Haz algo con la respuesta, como guardarla en una base de datos
    # Por ahora, solo imprimimos la respuesta en la consola ---  adaptar según necesidade
    print(paste("La respuesta seleccionada fue:", respuesta))
  })

}

# Creamos/ejecutamos la aplicación shiny
shinyApp(ui = ui, server = server)
