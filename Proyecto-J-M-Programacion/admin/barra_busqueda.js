  // Obtén la referencia al input de búsqueda y al botón
  var inputBusqueda = document.getElementById('buscador');
  var botonBusqueda = document.getElementById('boton');

  // Agrega un evento al botón para que llame a la función buscar al hacer clic
  botonBusqueda.addEventListener('click', buscar);

  // Agrega un evento al input para que llame a la función buscar al presionar Enter
  inputBusqueda.addEventListener('keyup', function(event) {
      if (event.key === 'Enter') {
          buscar();
      }
  });

  function buscar() {
      var input, filter, table, tr, td, i, txtValue;
      input = inputBusqueda;
      filter = input.value.toUpperCase();
      table = document.getElementById('table_inv');
      tr = table.getElementsByTagName('tr');

      for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName('td')[1]; // 1 es el índice de la columna "Nombre pedido"
          if (td) {
              txtValue = td.textContent || td.innerText;
              if (txtValue.toUpperCase().indexOf(filter) > -1) {
                  tr[i].style.display = '';
              } else {
                  tr[i].style.display = 'none';
              }
          }
      }
  }