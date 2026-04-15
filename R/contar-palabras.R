contarpalabras <- function() {
  # Leer todo el archivo README.md en una sola cadena
  if (!file.exists("README.md")) {
    stop("No se encontró el archivo 'README.md' en el directorio de trabajo.")
  }
  
  texto <- paste(readLines("README.Rmd", warn = FALSE), collapse = " ")
  
  # Buscar la primera aparición de la palabra 'Resumen'
  patron <- "Resumen\\b"
  pos <- regexpr(patron, texto)
  
  if (pos == -1) {
    stop("La cadena 'Resumen' no se encontró en el archivo README.md.")
  }
  
  # Tomar todo el texto que va después de la palabra 'Resumen'
  inicio_resumen <- pos + attr(pos, "match.length")
  texto_resumen <- substr(texto, inicio_resumen + 1, nchar(texto))
  texto_resumen <- trimws(texto_resumen)
  
  # Separar por espacios en blanco y contar palabras no vacías
  palabras <- unlist(strsplit(texto_resumen, "\\s+"))
  palabras <- palabras[nzchar(palabras)]
  
  length(palabras)
}
