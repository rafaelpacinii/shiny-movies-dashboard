library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$tabela <- DT::renderDataTable({
        final_data <- data |>
          dplyr::select(-img_url)
        
        DT::datatable(
          final_data,
          options = list(
            height = 400,
            paging = TRUE,
            scrollX = TRUE,
            autoWidth = TRUE,
            server = FALSE,
            columnDefs = list(
              list(targets = '_all', className = 'dt-center'),
              list(targets = "_all", render = DT::JS(
                "function(data, type, row, meta) {",
                "  if(type === 'display') {",
                "    return data.length > 20 ? data.substr(0, 20) + '...' : data;",
                "  }",
                "  return data;",
                "}"
              ))
            )
          ),
          extensions = 'Buttons',
          selection = 'single',
          filter = 'bottom',
          rownames = FALSE
        ) |>
        DT::formatStyle(
          1:ncol(final_data),
          whiteSpace = 'nowrap'
        ) |>
        DT::formatStyle(
          1:ncol(final_data),
          overflow = 'hidden',
          textOverflow = 'ellipsis',
          width = '200px'
        )
          
    })

}
